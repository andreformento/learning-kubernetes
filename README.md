# learning-kubernetes

- Install minikube
```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& sudo install -y minikube-linux-amd64 /usr/local/bin/minikube
```

- Start minikube
```shell
sudo minikube start --vm-driver=none
```

- Configure
```shell
kubectl config use-context minikube
```

- Permissions
```shell
rm -rf $HOME/.kube $HOME/.minikube
sudo cp -r /root/.kube /root/.minikube $HOME
sudo chown -R $USER $HOME/.kube $HOME/.minikube /etc/kubernetes
sudo chgrp -R $USER $HOME/.kube $HOME/.minikube /etc/kubernetes
```

- Edit configs `vim /home/andre/.kube/config` and replace `/root` for `/home/andre`

Delete
```shell
sudo minikube delete
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

## References
- https://github.com/wardviaene/kubernetes-course
