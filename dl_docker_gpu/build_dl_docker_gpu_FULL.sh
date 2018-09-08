#!/bin/sh
export DOCKER_ID_USER="sysfail"
export DOCKER_TAG="1"
echo "##### NEW BUILD RUN #####" >> nvidia_docker_build.log
echo " ### dl_docker_gpu ###" >> nvidia_docker_build.log
echo "$(date) $(ls -1 | wc -l)" >> nvidia_docker_build.log
echo "Docker tag: $DOCKER_TAG" >> nvidia_docker_build.log
echo "Docker ID: $DOCKER_ID_USER" >> nvidia_docker_build.log
echo "#########################" >> nvidia_docker_build.log
echo "Building base GPU image" >> nvidia_docker_build.log
docker build -f base -t dl_docker_gpu_base:$DOCKER_TAG .  2>&1 | tee -a nvidia_docker_build.log
docker tag dl_docker_gpu_base:$DOCKER_TAG "$DOCKER_ID_USER/dl_docker_gpu_base:$DOCKER_TAG"

echo "Build runtime image" >> nvidia_docker_build.log
docker build -f runtime -t dl_docker_gpu_runtime:$DOCKER_TAG . 2>&1 | tee -a nvidia_docker_build.log
docker tag dl_docker_gpu_runtime:$DOCKER_TAG "$DOCKER_ID_USER/dl_docker_gpu_runtime:$DOCKER_TAG"

echo "Build dev image" >> nvidia_docker_build.log
docker build -f devel -t dl_docker_gpu_devel:$DOCKER_TAG . 2>&1 | tee -a nvidia_docker_build.log
docker tag dl_docker_gpu_devel:$DOCKER_TAG "$DOCKER_ID_USER/dl_docker_gpu_devel:$DOCKER_TAG"

echo "Build cudnn image" >> nvidia_docker_build.log
docker build -f cudnn -t dl_docker_gpu_cudnn:$DOCKER_TAG . 2>&1 | tee -a nvidia_docker_build.log
docker tag dl_docker_gpu_cudnn:$DOCKER_TAG "$DOCKER_ID_USER/dl_docker_gpu_cudnn:$DOCKER_TAG"

echo "Build image with necessary python libs" >> nvidia_docker_build.log
docker build -f full_gpu -t dl_docker_gpu_full:$DOCKER_TAG . 2>&1 | tee -a nvidia_docker_build.log
docker tag dl_docker_gpu_full:$DOCKER_TAG "$DOCKER_ID_USER/dl_docker_gpu_full:$DOCKER_TAG"

docker tag dl_docker_gpu:$DOCKER_TAG "$DOCKER_ID_USER/dl_docker_gpu_full:$DOCKER_TAG"

echo "##### END OF BUILD RUN #####" >> nvidia_docker_build.log
