This directory is used for the purpose of debugging single mongoDB resource.  
Checking if mongoDB image works fine, all resources for mongoDB are bound correctly.

## env

Simgle mongoDB pod + sercret + PV/PVC

## start up

- apply debug resource
- setup database_debug resources
- exec mongo command to check connection.

```{bash}
($ make terminate) # if needed
$ make up
$ make apply_debug
$ kubectl apply -f ./database/debug
$ kbuectl exec hogehoge ~~
```