# Build docker image

Run following command.

```bash
docker/build_docker.sh
```

# Run docker container

```bash
docker run --rm -it --name CONTAINER_NAME -v HOST_PATH:CONTAINER_PATH --net=host --ulimit memlock=-1 --ulimit stack=67108864 mmintegrated:latest
```

# Code development

Code development of this repository is expected to be done by using vscode devcontainer.

1. Build docker container
2. Open command palette (ctl + shift + P)
3. Select "Dev Containers: Reopen in Container" or "Dev Containers: Rebuild and Reopen in Container"
