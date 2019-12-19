#!/bin/sh

result=`which podman`
if [ 0 -eq $? ]; then
  container=`podman ps | grep -e postgresql -e javadevelopment | awk '{print $1}'`
  for container_id in $container
  do 
    podman stop $container_id
  done
  podman ps -a
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
