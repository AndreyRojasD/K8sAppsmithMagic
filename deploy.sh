#!/bin/bash
minikube start --no-vtx-check

sleep 5

kubectl create namespace appsmith
kubectl apply -f appsmith
kubectl apply -f redis
kubectl apply -f mongo
kubectl get pods -n appsmit


check_all_running() {
    local pods_status="$1"
    local required_count="$2"
    local running_count=$(echo "$pods_status" | grep -c "Running")
    [ "$running_count" -eq "$required_count" ]
}

get_appsmith_pod_name() {
    kubectl get pods -n appsmith -l app=appsmith -o=jsonpath='{.items[0].metadata.name}'
}

PODS_STATUS=$(kubectl get pods -n appsmith -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.phase}{"\n"}{end}')
REQUIRED_COUNT=3

if check_all_running "$PODS_STATUS" "$REQUIRED_COUNT"; then
    echo "The pods are all in 'Running' state. Getting the URL from Appsmith..."
    APPSMITH_POD=$(get_appsmith_pod_name)
    kubectl port-forward -n appsmith "$APPSMITH_POD" 8080:80 &
else
    echo "Not all pods are in the 'Running' state. Waiting..."
    while ! check_all_running "$PODS_STATUS" "$REQUIRED_COUNT"; do
        sleep 5  
        PODS_STATUS=$(kubectl get pods -n appsmith -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.phase}{"\n"}{end}')
    done
    echo "The pods are all in 'Running' state. Getting the URL from Appsmith..."
    APPSMITH_POD=$(get_appsmith_pod_name)
    kubectl port-forward -n appsmith "$APPSMITH_POD" 8080:80 &
fi
