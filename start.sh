#!/bin/sh

result=`which podman`
if [ 0 -eq $? ]; then
  container=`podman ps -a | grep -e postgresql -e javadevelopment | awk '{print $1}'`
  for container_id in $container
  do 
    podman start $container_id
  done

  podman ps

else
  result=`which docker`
  if [ 0 -eq $? ]; then
    container=`docker ps -a | grep -e postgresql -e javadevelopment | awk '{print $1}'`
    for container_id in $container
    do 
      docker start $container_id
    done

    docker ps
  else
    echo 'dockerをインストールしてください'
  fi
fi


