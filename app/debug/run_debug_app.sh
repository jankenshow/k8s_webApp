#!/bin/sh

# VM_IP=$(minikube ip)
HOST_IP=$(ifconfig en0 | awk '/inet / {print $2}') #| awk -F: '{print $1}')

docker run --rm -d \
    --add-host "local_dev:${HOST_IP}" \
    -e MONGODB_USERNAME="user" \
    -e MONGODB_PASSWORD="welcome" \
    -e MONGODB_HOSTS="local_dev:32717" \
    -e MONGODB_DATABASE="weblog" \
    -p 8080:3000 \
    --name weblog-app_debug \
    weblog-app:v1.0.0
