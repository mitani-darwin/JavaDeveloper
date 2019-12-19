#!/bin/bash

result=`which podman`
if [ 0 -eq $? ]; then
  podman image build -f java/Dockerfile -t javadevelopment
  podman image build -f postgresql/Dockerfile -t postgresql
else 
  result=`which docker`
  if [ 0 -eq $? ]; then
    docker image build java/. -t javadevelopment
    docker image build postgresql/. -t postgresql

    docker network create -d bridge app_network
  else
    echo 'dockerをインストールしてください'
  fi
fi

