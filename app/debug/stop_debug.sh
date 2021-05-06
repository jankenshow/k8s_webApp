#!/bin/bash

YAML_DIR=$(cd $(dirname $0); pwd)

docker container stop weblog-app_debug
kubectl delete -f ${YAML_DIR}