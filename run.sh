#!/bin/bash

result=`which podman`
if [ 0 -eq $? ]; then
  java_image=`podman image ls | grep javadevelopment | awk '{print $3}'`
  postgresql_image=`podman image ls | grep postgresql | awk '{print $3}'`

  podman run --name javadevelopment -p 2222:22 -p 8081:8080 -itd $java_image
  podman run --name postgresql -p 5432:5432 -itd $postgresql_image

  podman ps
fi
