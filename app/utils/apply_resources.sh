#!/bin/bash

YAML_DIR=$(dirname $(cd $(dirname $0); pwd))

kubectl apply -f $YAML_DIR