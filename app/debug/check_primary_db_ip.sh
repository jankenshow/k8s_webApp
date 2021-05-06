#!/bin/bash

PRIMARY_DB=$(kubectl exec -it pod/mongo-0 -- mongo admin -u admin -p Passw0rd \
    --eval "rs.isMaster().primary" --quiet | tail -n 1 | cut -f 1 -d ':')
DNS_SERVER=$(kubectl get service -n kube-system kube-dns -o jsonpath='{.spec.clusterIP}')
PRIMARY_DB_IP=$(kubectl exec -it mongo-0 -- nslookup ${PRIMARY_DB} ${DNS_SERVER} | grep Address | tail -n +2 | cut -f 3 -d ' ')

echo "Primary DB : ${PRIMARY_DB} - ${PRIMARY_DB_IP}"

# kubectl get pod -o wide

