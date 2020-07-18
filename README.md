# learning-kubernetes

- Install minikube
```shell
./install-minukube.sh
```

- Start minikube _(enable v1alpha1)_
```shell
minikube start --nodes=2 \
               --memory='4000mb' \
               --cpus=4 \
               --disk-size=10g \
               --driver=kvm2 \
               --extra-config=apiserver.runtime-config=settings.k8s.io/v1alpha1=true
```

- Configure
```shell
kubectl config use-context minikube
```

Delete
```shell
minikube delete --all=true --purge=true
```

## Enable loadbalancer

- See what changes would be made, returns nonzero returncode if different
```shell
kubectl get configmap kube-proxy -n kube-system -o yaml | \
  sed -e "s/strictARP: false/strictARP: true/" | \
  kubectl diff -f - -n kube-system
kubectl get configmap kube-proxy -n kube-system -o yaml | \
  sed -e "s/mode: \"\"/mode: \"ipvs\"/" | \
  kubectl diff -f - -n kube-system
```

- Actually apply the changes, returns nonzero returncode on errors only
```shell
kubectl get configmap kube-proxy -n kube-system -o yaml | \
  sed -e "s/strictARP: false/strictARP: true/" | \
  kubectl apply -f - -n kube-system
kubectl get configmap kube-proxy -n kube-system -o yaml | \
  sed -e "s/mode: \"\"/mode: \"ipvs\"/" | \
  kubectl apply -f - -n kube-system
```

- Install metallb
```shell
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

- Configmap
```shell
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
```

- Get cm: `kubectl -n metallb-system get cm config`

- reference: https://metallb.universe.tf/installation

## Useful commands

- `kubectl get pod` - get information about all runnning pods
- `kubectl describe pod <pod>` - describe one pod
- `kubectl expose pod <pod> --port=444 --name=frontend` - expose the port of a pod (creates a new service)
- `kubectl port-forward <pod> 8080` - port forward the exposed pod port to your local machine
- `kubectl attach <pod> -i` - attach to the pod
- `kubectl exec <pod> -- command` - Execute a command on the pod
- `kubectl label pods <pod> my label=awesome` - Add a new label to a pod
- `kubectl run -i --tty busybox --image=busybox --restart=Never -- sh` - Run a shell in a pod - very useful for debugging
- `kubectl get deployments` - get information on current deployments
- `kubectl get rs` - get information about replica sets
- `kubectl get pods --show-labels` - get pods, and also show labels attached to those pods
- `kubectl set image deployment/helloworld-deployment k8s-demo=k8s-demo:2` - run k8s-demo with the image label version 2
- `kubectl edit deployment/helloworld-deployment` - edit the deployment object
- `kubectl rollout status deployment/helloworld-deployment` - get the status of the rollout
- `kubectl rollout history deployment/helloworld-deployment` - get the history of the rollout
- `kubectl rollout undo deployment/helloworld-deployment` - rollback to previous version
- `kubectl rollout undo deployment/helloworld-deployment --to-revision=n` - rollback to any version
- `kubectl explain pods` or `kubectl explain pod.spec` documentation
- `watch -n1 "kubectl get all -o wide --show-labels"`
- `kubectl logs pod my-name --previous` to show previous restarted pod
- `kubectl api-resources` show all resources
- `kubectl drain <node name>` and `kubectl uncordon <node name>` [safely drain node](https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/) and 

**NOTE** Although most objects' names must conform to the naming conventions specified in RFC 1035 (Domain names),
which means they may contain only letters, digits, dashes, and dots,
namespaces (and a few others) aren't allowed to contain dots.

## References
- https://kubernetes.io/docs/reference/kubectl/cheatsheet/
- [Calico on minikube](https://medium.com/@janhavi.virkar/creating-a-local-kubernetes-cluster-using-minikube-and-install-calico-cni-a4541b3009c5)
