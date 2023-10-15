#!/bin/bash
docker build -t mmIntegrated:latest -f docker/Dockerfile . --build-arg USERNAME=$LOGNAME --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g)
