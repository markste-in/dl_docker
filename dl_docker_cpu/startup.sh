#!/bin/bash
export DISPLAY=:1
/usr/sbin/sshd -D &
cd /docker
/root/start-ipython.sh
Xvfb :1 -screen 0 1600x900x16 &
sleep 2
openbox-session &
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
cd /root/noVNC && ln -s vnc_auto.html index.html && ./utils/launch.sh --vnc localhost:5900
