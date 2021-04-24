#!/bin/bash

KEY_FILE_DIR=$(dirname $(cd $(dirname $0); pwd))

kubectl create secret generic mongo-secret \
    --from-literal=root_username=admin \
    --from-literal=root_password=Passw0rd \
    --from-file=${KEY_FILE_DIR}/keyfile

kubectl get secret/mongo-secret -o yaml