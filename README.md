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
Client Version: v1.20.2
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

## Installation requirements

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
- explain about debug resource.
- describe for creating secret resources.
- build docker images in minikube env.
- revise makefile.

setup command does not build (also push into vm) docker images used for this app.  
Or simply build images in minikube vm.

## Run app (create kubernetes resources)

```
$ make apply
$ make init_db ## this takes few minutes
```

TODO
- application (node.js resources are under development)

## Stop app (delete kubernetes resources)

```
$ make delete
```

## Clean up app (stop app and delete DB data)

```
$ make terminate
```


## App architecture

- ingress
- nginx
- node.js
- mongodb


## Kubernetes architecture

### debug resource

### database resources

### application resources

### webserver resources

### ingress resources

## directories

<> is file.

```
.
├── Makefile                        : commands
├── README.md
├── app                             : application resources files
│   ├── debug
│   ├── docker                      : dockerfile and etc...
│   ├── src                         : the body of application. (node.js scripts)
│   ├── utils                       : commands related to application resources
│   └── <[resource].yaml>           : resources definition
├── database                        : mongodb resources files
│   ├── debug
│   ├── docker
│   ├── <keyfile>                   : secrets value file for mongodb environment
│   ├── utils
│   └── <[resource].yaml>
├── debug                           : debug pod files
│   ├── docker
│   ├── utils
│   ├── <mongodb-org-4.0.repo>      : mongodb client repository file
│   └── <[resource].yaml>
├── sever                           : webserver resouces files
│   ├── docker
│   ├── utils
│   └── <[resource].yaml>
├── storage                         : mongodb data directory
├── <Makefile>                      : shortcut commands
└── <minikube_hogehoge.sh>          : commands to start minikube cluster
```