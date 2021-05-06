#!/bin/bash

docker container stop weblog-app_debug
kubectl delete svc/mongodb