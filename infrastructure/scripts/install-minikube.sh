#!/bin/bash

set -eaux pipefail

# Function to download minikube if not already installed
function dowlnoad_minikube() {
  echo "Checking if Minikube is already installed..."
  if ! which minikube >/dev/null 2>&1; then
    echo "Minikube is not installed. Downloading..."
    local minikube_url="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
    local minikube_path="/usr/local/bin/minikube"

    curl -LO "$minikube_url"
    sudo install minikube-linux-amd64 "$minikube_path"
  else
    echo "Minikube is already installed."
  fi
}

# Function to install minikube with default settings
function simple_install_minikube() {
  dowlnoad_minikube
  minikube start
}

# Function to install minikube with custom settings
function custom_install_minikube() {
  dowlnoad_minikube
  minikube start \
    --driver=docker \
    --cpus 4 \
    --memory 8192 \
    --disk-size 50g \
    --addons=storage-provisioner \
    --addons=default-storageclass \
    --addons=metrics-server \
    --addons=dashboard \
    --kubernetes-version v1.28.0
}

# Validate user input and install minikube accordingly
if [ "$1" = "simple" ]; then
  simple_install_minikube
elif [ "$1" = "custom" ]; then
  custom_install_minikube
else
  echo "Invalid argument. Please specify 'simple' or 'custom'."
fi


