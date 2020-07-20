#!/bin/bash

# Remove all
minikube delete --all=true --purge=true

# Create cluster
minikube start --nodes=2 \
               --memory='4000mb' \
               --cpus=4 \
               --disk-size=10g \
               --driver=kvm2 \
               --extra-config=apiserver.runtime-config=settings.k8s.io/v1alpha1=true

kubectl config use-context minikube

# Configure load balancer
configureLoadBalancer() {
  kubectl get configmap kube-proxy -n kube-system -o yaml | \
    sed -e "s/strictARP: false/strictARP: true/" | \
    kubectl apply -f - -n kube-system
  kubectl get configmap kube-proxy -n kube-system -o yaml | \
    sed -e "s/mode: \"\"/mode: \"ipvs\"/" | \
    kubectl apply -f - -n kube-system

  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
  kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

  MINIKUBE_IP=$(minikube ip)
  export MINIKUBE_BASE_IP=${MINIKUBE_IP%.*}
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - ${MINIKUBE_BASE_IP}.95-${MINIKUBE_BASE_IP}.105
EOF

}

minikube addons enable ingress
