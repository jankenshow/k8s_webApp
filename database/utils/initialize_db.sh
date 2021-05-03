#!/bin/bash

kubectl exec -it pod/mongo-0 -- /data/src/replicate_db.sh; \
sleep 15; \
kubectl exec -it pod/mongo-0 -- /data/src/init.sh


## wait for services (endpoints) are activated
## command below is to get list of [service name, endpoint
# kubectl get -o json -l app=weblog endpoints | jq '.items[] | [.metadata.name, ([.subsets[].addresses[].targetRef.name] | join(", "))] | @tsv' --raw-output