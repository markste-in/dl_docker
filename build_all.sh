#!/bin/bash
echo "Start to build dl_docker_cpu"
cd dl_docker_cpu
./build_docker.sh
cd ..
cd dl_docker_gpu
./build_dl_docker_gpu_FULL.sh
