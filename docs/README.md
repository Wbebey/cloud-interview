# ornikar-test

## requirements

you have to install the following tools to run this project:

- [Docker](https://www.docker.com/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [helm](https://helm.sh/docs/intro/install/)
- [helmfile](https://github.com/helmfile/helmfile)
- [make](https://www.gnu.org/software/make/)

## How to run

For simple deployment, you can run the following commands:

**Note:** you can change the `Makefile` to use your own docker registry.

```bash
# install minikube
make install-minikube

# install traefik
make install-traefik

# build images
make build

# push images -- you need to change the Makefile to use your own docker registry
# make push

# package charts
make package

# deploy charts
make deploy

```

## file structure

To make the project more readable, I have divided the project into the following sections:

```bash
.
├── apps
│   ├── hello
│   │   ├── ...
│   │   ├── ...
│   │   ├── Dockerfile # dockerfile for building the image
│   └── world
│       ├── ...
│       ├── ...
│       ├── Dockerfile # dockerfile for building the image
│       ├── httpd.conf # apache config file
├── docker-compose.yml # docker-compose file for running the application
├── docs
│   └── README.md
├── helmfile.yaml
├── infrastructure
│   ├── helm
│   │   └── stateless-ornikar # helm chart for deploying the application
│   │       ├── charts
│   │       │   ├── Chart.yaml
│   │       │   ├── templates
│   │       │   │   ├── ing.yaml
│   │       │   │   ├── serviceaccount.yaml
│   │       │   │   ├── stateless.yaml
│   │       │   │   ├── svc.yaml
│   │       │   │   └── tests
│   │       │   │       └── test-connection.yaml
│   │       │   └── values.yaml
│   │       ├── README.md
│   └── scripts # scripts for installing dependencies and minikube
│       ├── install-dependencies.sh
│       ├── install-minikube.sh
│       └── kube-base-config.yaml
├── Makefile # makefile for building and deploying the application
├── README.md
```

## kubernetes

Application are running in the namespace `ornikar` and both are serving through the same ingress.

```bash
$ kubectl get pods -n ornikar
NAME                                     READY   STATUS    RESTARTS   AGE
hello-7f8d7f8d5d-4q9q8   1/1     Running   0          2m
world-7f8d7f8d5d-2q9q8   1/1     Running   0          2m

$ kubectl get svc -n ornikar
NAME                      TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
hello   ClusterIP
world   ClusterIP
```