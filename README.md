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



## References
- https://github.com/wardviaene/kubernetes-course
