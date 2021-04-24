#!/bin/bash

CONTEXT_DIR=$(cd $(dirname $0); pwd)

docker build --no-cache -t weblog-db:v1.0.0 ${CONTEXT_DIR} #&& \
# minikube image load weblog-db:v1.0.0