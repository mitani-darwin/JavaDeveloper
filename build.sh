#!/bin/bash

result=`which podman`
if [ 0 -eq $? ]; then
  podman image build -f java/Dockerfile -t javadevelopment
  podman image build -f postgresql/Dockerfile -t postgresql
fi

