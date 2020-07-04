# Kubernetes in action

- create a replication controller (rc): `kubectl run kubia --image=luksa/kubia --port=8080 --generator=run/v1`
- create a service: `kubectl expose rc kubia --type=LoadBalancer --name kubia-http`
- scale rc: `kubectl scale rc kubia --replicas=3`

## References
- https://www.manning.com/books/kubernetes-in-action
- https://github.com/luksa/kubernetes-in-action
