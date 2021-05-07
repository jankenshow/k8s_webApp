#!/bin/bash

HOST_IP=$(ifconfig en0 | awk '/inet / {print $2}')

docker run --rm -d \
    -e APPLICATION_HOST="${HOST_IP}:30000" \
    -p 8080:80 \
    --name weblog-server_debug \
    weblog-web:v1.0.0