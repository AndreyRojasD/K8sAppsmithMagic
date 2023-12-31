#!/bin/bash

echo "Install Kubectl...."
curl -LO https://dl.k8s.io/release/v1.29.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

rm kubectl

echo "Install minikube...."

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

rm minikube-linux-amd64

echo "Install Docker"

sudo apt install docker

echo "Testing installs..."

echo "Testing Kubectl..."

kubectl version --client > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Kubectl is installed and functioning correctly."
else
    echo "There is an issue with kubectl"
fi

echo "Testing Docker..."

docker version > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Docker is installed and functioning correctly."
else
    echo "There is an issue with Docker"
fi

echo "Testing Minikube"

minikube version > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Minikube is installed and functioning correctly."
else
    echo "There is an issue with Minikube."
fi
