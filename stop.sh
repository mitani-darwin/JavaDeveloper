#!/bin/sh

PATH=$PATH:/usr/local/bin;
result=`which podman-compose`
if [ 0 -eq $? ]; then
  container=`podman pod ps | grep -e java_developer | awk '{print $1}'`
  for container_id in $container
  do 
    podman pod stop $container_id
  done
  podman pod ps
else
  result=`which docker`
  if [ 0 -eq $? ]; then
    docker-compose stop
    docker-compose ps
  else
    echo 'dockerをインストールしてください'
  fi
fi
