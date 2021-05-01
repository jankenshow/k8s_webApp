Under development.

# About this project

This project runs web app on kubernetes cluster, learning kubernetes basics.

refs: 
- https://kubernetes.io/docs/home/
- https://minikube.sigs.k8s.io/docs/



## Environment

- macOS
- docker (to build custom image)
- ~~hyperkit (as a vm tool for minikube)~~
- minikube 

kubernetes versions in minikube

```
Client Version: v1.19.7
Server Version: v1.20.2
```

Minikube creates vm on your mac (host PC), and kubernetes cluster runs on this vm.  
Although Minikube recommends docker as a vm driver, docker on mac (darwin) couldn't use ingress addon.  
So, in this project, we use hyperkit as a vm driver.

-> mongodb could not be initialized in hyperkit vm driver with error message below,  
   and we change this driver to docker driver.

```
WiredTiger error (22) [1619810532:313247][10:0x7f6475e74ca8], connection: __posix_sync, 108: /data/db/: directory-sync: fdatasync: Invalid argument Raw: [1619810532:313247][10:0x7f6475e74ca8], connection: __posix_sync, 108: /data/db/: directory-sync: fdatasync: Invalid argument
```

## Installartion requirements

```
## Install one you like.
$ brew install docker 
$ brew install docker —cask 

# ## Install hyperkit if not installed.
# $ brew install hyperkit

## Install kubernetes tools.
$ brew install minikube
# $ brew install kubectl

## To install specific version of kubectl. (Homebrew is intended to install the latest version.)
$ cd /usr/local/bin
$ curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.20.2/bin/darwin/amd64/kubectl
$ chmod +x ./kubectl
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
- explain about secrets resource.

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