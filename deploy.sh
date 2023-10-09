#!/bin/bash
kubectl create namespace appsmith
kubectl apply -f mongo-deployment.yaml 
kubectl apply -f mongo-service.yaml 
kubectl apply -f redis-deployment.yaml 
kubectl apply -f redis-service.yaml 
kubectl apply -f appsmith-deployment.yaml 
kubectl apply -f appsmith-service.yaml 
kubectl apply -f appsmith-conf.yaml
kubectl get pods -n appsmith