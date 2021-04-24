#!/bin/bash

YAML_DIR=$(dirname $(cd $(dirname $0); pwd))

kubectl delete -f $YAML_DIR