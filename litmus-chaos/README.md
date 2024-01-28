# litmus-chaos

- https://litmuschaos.io
- `minikube start --memory='12000mb' --cpus=8 --disk-size=10g`
- [install](https://docs.litmuschaos.io/docs/getting-started/installation#install-litmus-using-helm)
- `alias litmus='kubectl -n litmus'`
- `minikube -n litmus service chaos-litmus-frontend-service --url`
- `kubectl apply -f chaos1-litmus-chaos-enable.yml`
