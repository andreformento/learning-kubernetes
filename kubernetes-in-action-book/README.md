# Kubernetes in action

- create a replication controller (rc): `kubectl run kubia --image=luksa/kubia --port=8080 --generator=run/v1`
- create a service: `kubectl expose rc kubia --type=LoadBalancer --name kubia-http`
- scale rc: `kubectl scale rc kubia --replicas=3`

### UNDERSTANDING THE DIFFERENCE BETWEEN THE SHELL AND EXEC FORMS
- shell form - e.g. `ENTRYPOINT node app.js` -> The node process would be started from that shell (unnecessary)
- **exec form** - e.g. `ENTRYPOINT ["node", "app.js"]` -> This runs the node process directly (not inside a shell)

## 6 storage

### pv
- create
```shell
kubectl apply -f book-examples/Chapter06/mongodb-pv-hostpath.yaml
kubectl apply -f book-examples/Chapter06/mongodb-pvc.yaml
kubectl apply -f book-examples/Chapter06/mongodb-pod-pvc.yaml
```

- delete
```shell
kubectl delete -f book-examples/Chapter06/mongodb-pod-pvc.yaml
kubectl delete -f book-examples/Chapter06/mongodb-pvc.yaml
kubectl delete -f book-examples/Chapter06/mongodb-pv-hostpath.yaml
```

## 7 configmap and secrets

```shell
kubectl create configmap fortune-config --from-file=book-examples/Chapter07/configmap-files
kubectl get configmap fortune-config -o yaml
```


## References
- https://www.manning.com/books/kubernetes-in-action
- https://github.com/luksa/kubernetes-in-action
