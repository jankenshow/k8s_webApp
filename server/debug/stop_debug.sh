#!/bin/bash

docker container stop weblog-server_debug
kubectl delete svc/nodeapp