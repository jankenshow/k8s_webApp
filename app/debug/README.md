This directory is used for the purpose of debugging connection weblog app and mongoDB resources.

## env

The weblog app runs on our local docker container.  
This app tries to access mongoDB on kubernetes cluster you applied.  
To access mongoDB on kubernetes cluster, new Service resource are created and exposed to minikube network with access to  
primary mongoDB, which is specified by Endpoints resource.  
(As you know, minikube IP:port is exposed to local network when we execute `minikube_docker.sh`.)

Baisically we can setup this debug app in one command, but we have to set primary mongoDB's IP address  
as Endpoints can identify where is the primary (because there are three mongoDB replications).

## start up

- apply database resources
- init database
- setup app_debug resources, docker container with a command below

```{bash}
($ make terminate) # if needed
$ make up
$ make apply
$ make init_db
$ make apply_app_debug
```

When Running command, we can see IP adress to access database for the app-debug on terminal output.  
Then, you should overwrite Endpoints settings in `app/debug/weblog-db-service.yaml` with this IP.  
