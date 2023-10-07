#!/bin/bash
kubectl create namespace appsmith
kubectl apply -f mongo-deployment.yaml --record=true
kubectl apply -f mongo-service.yaml --record=true
kubectl apply -f redis-deployment.yaml --record=true
kubectl apply -f redis-service.yaml --record=true
kubectl get pods
kubectl apply -f appsmith-deployment.yaml --record=true
kubectl apply -f appsmith-service.yaml --record=true
