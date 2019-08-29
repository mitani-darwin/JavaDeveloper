#!/bin/bash

image=`podman image ls | awk '{print $3}' | awk 'NR==2'`
podman run --name javaDevelopment -p 2222:22 -itd $image
