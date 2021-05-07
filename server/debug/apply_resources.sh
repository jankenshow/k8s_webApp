#!/bin/bash

YAML_DIR=$(cd $(dirname $0); pwd)

kubectl apply -f ${YAML_DIR}