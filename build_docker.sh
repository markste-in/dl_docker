#!/bin/sh
export DOCKER_ID_USER="sysfail"
export DOCKER_TAG=2
docker build -f dockerfile -t dl_docker:$DOCKER_TAG .
docker tag dl_docker:$DOCKER_TAG "$DOCKER_ID_USER/dl_docker:$DOCKER_TAG"
