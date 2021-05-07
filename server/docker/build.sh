#!/bin/bash

CONTEXT_DIR=$(cd $(dirname $0); pwd)

docker build -t weblog-web:v1.0.0 ${CONTEXT_DIR} && \
minikube image load weblog-web:v1.0.0