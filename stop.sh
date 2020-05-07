#!/bin/sh

PATH=$PATH:/usr/local/bin;
result=`which podman-compose`
if [ 0 -eq $? ]; then
  podman-compose stop
  podman-compose ps
else
  result=`which docker`
  if [ 0 -eq $? ]; then
    docker-compose stop
    docker-compose ps
  else
    echo 'dockerをインストールしてください'
  fi
fi
