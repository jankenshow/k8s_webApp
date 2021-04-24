#!/bin/bash

PROJECT_DIR=$(cd $(dirname $0); pwd)

minikube start \
    --mount --mount-string="${PROJECT_DIR}:/home/docker/webApp" \
    # --mount-string="${PROJECT_DIR}/storage:/data/storage" \
    --ports 30000 \
    --delete-on-failure