#!/bin/bash

PROJECT_DIR=$(cd $(dirname $0); pwd)

minikube start \
    --driver docker \
    --memory 6g \
    --mount --mount-string="${PROJECT_DIR}:/home/docker/webApp" \
    --ports 30000:30000,32717:32717 \
    --kubernetes-version="v1.20.2" \
    --delete-on-failure

# --mount-string="${PROJECT_DIR}/storage:/data/storage" \
