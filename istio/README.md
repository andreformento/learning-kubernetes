# Istio

- start minikube
```shell
minikube start \
               --memory='8000mb' \
               --cpus=7 \
               --disk-size=10g \
               --driver=kvm2
```

- [download](https://istio.io/latest/news/releases/1.6.x/announcing-1.6.5/)

- install on cluster
```shell
istioctl install --set profile=demo
```

- create a new namespace for istio
```shell
kubectl apply -f namespace.yaml
```

- show namespaces with labels
```shell
kubectl get namespace -L istio-injection
```

## References

- [Outlier detection](https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/upstream/outlier)
- [Virtual service](https://istio.io/latest/docs/reference/config/networking/virtual-service)
- [Erich workshop](https://github.com/erichegt/workshops/tree/istio-with-helm/hello-istio)
