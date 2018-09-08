#!/bin/bash
tag=1a
unameOut="$(uname -s)"
repository="sysfail"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo ${machine}


mkdir -p ~/docker/share

if [ "$machine" = "Mac" ]; then
  echo "Running on Mac"
  open "https://localhost:8888"
else
  echo "Running on Linux or others"
  xdg-open "https://localhost:8888"
fi
echo "Checking your internet connection and pulling sysfail/dl_docker_cpu:${tag}"
nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?
if [ $online -eq 0 ]; then
    echo "Online, try to get the latest image"
    docker pull sysfail/dl_docker_gpu_full:${tag}
    img_avilable=$?
    if [ "$img_avilable" != 0 ]; then
      echo "Image not found online. Try to run local image"
    fi
else
    echo "Offline, try to run a local image "
  fi
  nvidia-docker run --runtime=nvidia --rm -it -p 8888:8888 -p 6006:6006 -p 5900:5900 -p 6080:6080 -p 22:22 -v ~/docker/share:/docker/share -w /docker dl_docker_gpu_full:${tag}
