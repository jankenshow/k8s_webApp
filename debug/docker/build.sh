#!/bin/bash

CONTEXT_DIR=$(cd $(dirname $0); pwd)

docker build -t debug:k8s_webApp ${CONTEXT_DIR} && \
minikube image load debug:k8s_webApp

## will be deprecated in upcoming versions
# minikube cache add debug:k8s_webApp