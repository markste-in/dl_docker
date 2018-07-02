#!/bin/bash
tag=2
unameOut="$(uname -s)"
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
  open "http://localhost:8888"
else
  echo "Running on Linux or others"
  xdg-open "http://localhost:8888"
fi
echo "pulling sysfail/dl_docker:${tag}"
docker pull sysfail/dl_docker:${tag} && docker run -it -p 8888:8888 -p 6006:6006 -v ~/docker/share:/docker/share -w /docker sysfail/dl_docker:${tag}
