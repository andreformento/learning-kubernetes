- Create an image
```shell
docker build -t hello-node-formento:0.0.1 .
```

- Create a deployment (with my image)
```shell
kubectl create deployment hello-node-local --image=hello-node-formento:0.0.1
```

- Create a deployment (with ready template)
```shell
kubectl create deployment hello-node-remote --image=gcr.io/hello-minikube-zero-install/hello-node
```
