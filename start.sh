#!/bin/sh

PATH=$PATH:/usr/local/bin;
result=`which podman-compose`
if [ 0 -eq $? ]; then
  podman-compose up -d
else
  result=`which docker-compose`
  if [ 0 -eq $? ]; then
    docker-compose up -d
  else
    echo 'dockerをインストールしてください'
  fi
fi


