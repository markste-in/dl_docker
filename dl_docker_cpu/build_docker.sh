#!/bin/sh
export DOCKER_ID_USER="sysfail"
export DOCKER_TAG="1a"
echo "##### NEW BUILD RUN #####" >> docker_build_cpu.log
echo " ### dl_docker_cpu ###" >> docker_build_cpu.log
echo "$(date) $(ls -1 | wc -l)" >> docker_build_cpu.log
echo "Docker tag: $DOCKER_TAG" >> docker_build_cpu.log
echo "Docker ID: $DOCKER_ID_USER" >> docker_build_cpu.log
echo "#########################" >> docker_build_cpu.log
docker build -f dockerfile -t dl_docker_cpu:$DOCKER_TAG . 2>&1 | tee -a docker_build_cpu.log
echo "##### END OF BUILD RUN #####" >> docker_build_cpu.log
docker tag dl_docker_cpu:$DOCKER_TAG "$DOCKER_ID_USER/dl_docker_cpu:$DOCKER_TAG"
