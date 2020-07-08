Build
```shell
docker build -t kubia .
```

Run
```shell
docker run --rm --name kubia-container -p 8080:8080 -d kubia
```

Get inside
```shell
docker exec -it kubia-container bash
```
