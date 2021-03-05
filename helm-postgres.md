# Postgres with helm

- [Install helm](https://helm.sh/docs/intro/install/)

- start minikube
```shell
minikube start --memory='10000mb' \
               --cpus=8 \
               --disk-size=20g
```

- search for postgres
```shell
helm search repo postgres
```

- install specific version and wait for success (or delete)
```shell
helm install postgres-dev bitnami/postgresql --version 10.3.11 --atomic
```

- see notes
```shell
helm get notes postgres-dev
```

- remove everything
```shell
helm delete postgres-dev
kubectl delete pvc -l app.kubernetes.io/instance=postgres-dev
```

## References

- https://sandeepbaldawa.medium.com/basic-postgres-database-in-kubernetes-23c7834d91ef
- https://github.com/bitnami/charts/tree/master/bitnami/postgresql
