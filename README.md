# learning-kubernetes

- Install minikube
```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

- Start minikube
```shell
sudo minikube start --vm-driver=none
```

- Permissions
```shell
rm -rf $HOME/.kube $HOME/.minikube
sudo mv /root/.kube /root/.minikube $HOME
sudo chown -R $USER $HOME/.kube $HOME/.minikube /etc/kubernetes
sudo chgrp -R $USER $HOME/.kube $HOME/.minikube /etc/kubernetes
```

- Edit configs `vim /home/andre/.kube/config` and replace `/root` for `/home/andre`

Delete
```shell
sudo minikube delete
```
