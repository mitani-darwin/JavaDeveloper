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
    container=`docker ps | grep -e postgresql -e javadevelopment | awk '{print $1}'`
    for container_id in $container
    do 
      docker stop $container_id
    done
    docker ps -a
  else
    echo 'dockerをインストールしてください'
  fi
fi
