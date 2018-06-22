#!/bin/sh
mkdir -p ~/docker/share
chromium-browser http://localhost:8888
docker run -it -p 8888:8888 -p 6006:6006 -v ~/docker/share:/docker/share -w /docker markstein/dl_docker:1.0
