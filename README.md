Under development.

# About this project

This project runs web app on kubernetes cluster, learning kubernetes basics.

refs: 
- https://kubernetes.io/docs/home/
- https://minikube.sigs.k8s.io/docs/



## Environment

- macOS
- ~~docker (as a vm tool for minikube)~~
- hyperkit
- minikube 

kubernetes versions in minikube

```
Client Version: v1.19.7
Server Version: v1.20.2
```

Minikube creates vm on your mac (host PC), and kubernetes cluster runs on this vm.  
Although Minikube recommends docker as a vm driver, docker on mac (darwin) couldn't use ingress addon.  
So, in this project, we use hyperkit as a vm driver.


## Installartion requirements

```
## install one you like
$ brew install docker 
$ brew install docker —cask 

## install kubernetes tools
$ brew install minikube
$ brew install kubectl
```


## Kubernetes environment setup

In project root directory, run command below.  
(If not specified, directories where instructions run commands are this directory.)

```
$ make setup
```

Above command creates kubernetes cluster with minikube vm environment,  
mounting this project directory of host PC to minikube vm's `/home/docker/webApp` directory.

refs :
- https://thospfuller.com/2020/12/09/learn-how-to-mount-a-local-drive-in-a-pod-in-minikube-2021/


TODO
- build docker images
- push images into minikube vm

setup command does not build (also push into vm) docker images used for this app.  
Or simply build images in minikube vm.

## Run app (create kubernetes resources)

```
$ make run
```


## Stop app (delete kubernetes resources)

```
$ make stop
```

## Clean up app (stop app and delete DB data)

```
$ make delete
```


## App architecture

- nginx
- node.js server
- mongodb


## Kubernetes architecture

### debug pod

### database statefulset


## directories

<> is file.

```
.
├── Makefile                        : commands
├── README.md
├── database                        : mongodb resource files
│   ├── docker                      : dockerfile and etc...
│   ├── <keyfile>                   : secrets value file for mongodb environment
│   ├── utils                       : commands related to mongodb resources
│   └── <[resource].yaml>           : resources definition
├── debug                           : debug pod files
│   ├── <[resource].yaml>
│   ├── docker
│   ├── <mongodb-org-4.0.repo>      : mongodb client repository file
│   └── utils
├── <minikube.sh>                   : minikube start commands
└── storage                         : mongodb data directory
```