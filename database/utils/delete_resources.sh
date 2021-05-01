#!/bin/bash

YAML_DIR=$(dirname $(cd $(dirname $0); pwd))
# PROJECT_DIR=$(dirname $(dirname $(cd $(dirname $0); pwd)))

GRACE=$(kubectl get pods mongo-0 --template '{{.spec.terminationGracePeriodSeconds}}')
kubectl delete sts -l app=weblog
sleep $GRACE
kubectl delete pvc,pv -l app=weblog

# kubectl delete \
#     pv/storage-volume-0 \
#     pv/storage-volume-1 \
#     pv/storage-volume-2 \
#     pvc/storage-mongo-0 \
#     pvc/storage-mongo-1 \
#     pvc/storage-mongo-2
# kubectl delete sts/mongo secret/mongo-secret
