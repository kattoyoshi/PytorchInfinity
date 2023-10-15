#!/bin/bash
docker build -t mmintegrated:latest -f docker/Dockerfile . --build-arg USERNAME=$LOGNAME --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g)
