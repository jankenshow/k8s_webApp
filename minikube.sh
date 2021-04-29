#!/bin/bash

PROJECT_DIR=$(cd $(dirname $0); pwd)

minikube start \
    --driver=hyperkit \
    --mount --mount-string="${PROJECT_DIR}:/home/docker/webApp" \
    --addons ingress \
    --delete-on-failure

# --mount-string="${PROJECT_DIR}/storage:/data/storage" \