# learning-kubernetes

- Install minikube
```shell
./install-minukube.sh
```

- Start minikube _(enable v1alpha1)_
```shell
minikube start --nodes=2 \
               --memory='8000mb' \
               --cpus=8 \
               --extra-config=apiserver.runtime-config=settings.k8s.io/v1alpha1=true
```

- Configure
```shell
kubectl config use-context minikube
```

Delete
```shell
minikube delete
```

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
