#!/bin/bash

YAML_DIR=$(dirname $(cd $(dirname $0); pwd))
PROJECT_DIR=$(dirname $(dirname $(cd $(dirname $0); pwd)))

kubectl delete -f $YAML_DIR
rm -rf ${PROJECT_DIR}/storage/**
touch ${PROJECT_DIR}/storage/.gitkeep