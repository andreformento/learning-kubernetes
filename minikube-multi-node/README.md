# Minikube with multi-nodes

- `minikube status`
- `kubectl get nodes`
- `kubectl apply -f hello-deployment.yaml`
- `kubectl rollout status deployment/hello`
- `kubectl apply -f hello-svc.yaml`
- `kubectl get pods -o wide`
- `minikube service list`
- `kubectl delete daemonsets,replicasets,services,deployments,pods,rc --all`

## References
- https://minikube.sigs.k8s.io/docs/tutorials/multi_node