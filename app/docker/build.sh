#!/bin/bash

CONTEXT_DIR=$(dirname $(cd $(dirname $0); pwd))


docker build -t weblog-app:v1.0.0 -f ${CONTEXT_DIR}/docker/Dockerfile ${CONTEXT_DIR} && \
minikube image load weblog-app:v1.0.0