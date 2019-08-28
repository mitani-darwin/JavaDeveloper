#!/bin/bash

image=`podman image ls | awk '{print $3}' | awk 'NR==2'`
podman run -p 10022:22 -it $image /bin/bash
