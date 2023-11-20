# Make file to run easyly things you need

SHELL = /bin/bash

kubernetes_folder = .kubernetes/
helm_folder = ./infrastructure/helm/stateless-ornikar
scripts_folder = ./infrastructure/scripts
namespace = ornikar
version = 0.2.0

install-minikube:
	"$(scripts_folder)"/install-minikube.sh

install-minikube:
	"$(scripts_folder)"/install-traefik.sh

build:
	docker-compose build --no-cache

push:
	docker-compose push

package:
	helm lint $(helm_folder)/charts && \
	helm package $(helm_folder)/charts

deploy:
# helmfile apply
	helm upgrade -i ornikar-test stateless-ornikar-"$(version)".tgz --version "$(version)" -f .kubernetes/hello-helm.yaml -n ornikar --set "stateless[0].image=wbarmis/ornikar-hello:1.0.5"
	helm upgrade -i ornikar-cloud stateless-ornikar-"$(version)".tgz --version "$(version)" -f .kubernetes/world-helm.yaml -n ornikar --set "stateless[0].image=wbarmis/ornikar-world:1.0.5"

.PHONY: install-minikube install-traefik build push package deploy