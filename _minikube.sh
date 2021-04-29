#!/bin/bash

PROJECT_DIR=$(cd $(dirname $0); pwd)

minikube start \
    --driver docker \
    --mount --mount-string="${PROJECT_DIR}:/home/docker/webApp" \
    --ports 30000 \
    --delete-on-failure

# --mount-string="${PROJECT_DIR}/storage:/data/storage" \
