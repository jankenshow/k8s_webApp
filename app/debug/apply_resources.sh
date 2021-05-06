#!/bin/bash

YAML_DIR=$(cd $(dirname $0); pwd)

echo "You should change Endpoints IP adress in './app/debug/weblog-db-service.yaml'."
echo -n "Are you sure to apply this app-debug yaml? (y/N) : "
read -t 30 yn # -p option doesn't work as expected. I don't know why.
case "${yn}" in [yY]*) ;; *) echo "aborted." ; exit;; esac

kubectl apply -f ${YAML_DIR}