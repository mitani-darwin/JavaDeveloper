#!/bin/sh

PATH=$PATH:/usr/local/bin;
result=`which podman-compose`
if [ 0 -eq $? ]; then
  `podman pod stop java_developer`
  `podman pod rm -f java_developer`
  container=`podman image ls | grep -e java_developer | awk '{print $1}'`
  for container_id in $container
  do 
    podman rmi $container_id
  done

  podman ps 
else
  result=`which docker-compose`
  if [ 0 -eq $? ]; then
    container=`docker-compose ps -a | grep -e postgresql -e javadevelopment | awk '{print $1}'`
    for container_id in $container
    do 
      docker stop $container_id
      docker rm $container_id
    done
  else
    echo 'dockerをインストールしてください'
  fi
fi

