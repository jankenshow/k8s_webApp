#!/bin/bash

kubectl delete -f ..
minikube image rm weblog-db:v1.0.0
docker image rm weblog-db:v1.0.0