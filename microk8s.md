# Microk8s

## Service
```shell
sudo snap enable microk8s
sudo snap disable microk8s
snap info microk8s
```

## Useful commands
- kubectl
```shell
microk8s kubectl [command]
```

- Addons
```shell
microk8s status
microk8s enable [addons...]
microk8s disable [addons...]
```

References
- https://microk8s.io/docs/commands
- https://microk8s.io/docs/addons
