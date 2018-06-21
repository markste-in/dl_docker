#!/bin/sh
mkdir ~/dockershare
chromium-browser http://localhost:8888
docker run -it -p 8888:8888 -p 6006:6006 -v ~/dockershare:/dockershare -w /dockershare markstein/dl_docker:1.0
