#!/bin/bash

YAML_DIR=$(dirname $(cd $(dirname $0); pwd))

kubectl apply -f $YAML_DIR

## this command is alternative for the command `kubectl wait --for=condition=Ready=True pod/mongo-0`
while [[ $(kubectl get pods -n default mongo-0 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do 
    echo "waiting for pod/mongo-0 creation" && sleep 1
done; \
kubectl cp ${YAML_DIR}/src default/mongo-0:/data/

while [[ $(kubectl get pods -n default mongo-1 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do 
    echo "waiting for pod/mongo-1 creation" && sleep 1
done;
# kubectl cp ${YAML_DIR}/src default/mongo-1:/data/

while [[ $(kubectl get pods -n default mongo-2 -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do 
    echo "waiting for pod/mongo-2 creation" && sleep 1
done
# kubectl cp ${YAML_DIR}/src default/mongo-2:/data/



# kubectl get pods -l app=weblog -l type=database -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}'
# find ${YAML_DIR}/src/* | xargs -I{} kubectl cp {} default/mongo-0:/data/