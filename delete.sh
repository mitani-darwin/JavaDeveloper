#!/bin/sh

PATH=$PATH:/usr/local/bin;
result=`which podman-compose`
if [ 0 -eq $? ]; then
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
    docker-compose down
    container=`docker image ls | grep -e java_developer | awk '{print $1}'`
    for container_id in $container
    do 
      docker rmi $container_id
      docker image ls
    done
  else
    echo 'dockerをインストールしてください'
  fi
fi

