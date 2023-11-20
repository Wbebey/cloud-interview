#!/bin/bash

set -eaux pipefail

function create_namespaces() {
  kubectl apply -f kube-base-config.yaml
}

function install_traefik() {
  helm repo add traefik https://traefik.github.io/traefik-helm-chart
  helm repo update
  helm install traefik traefik/traefik --namespace ingress-traefik
}

main() {
  create_namespaces
  install_traefik
}
