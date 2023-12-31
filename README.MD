# AppsmithMagic

## What is Appsmith Magic?

AppsmithMagic is [Appsmith](https://www.appsmith.com/) with a touch of magic for Kubernetes deployments. The goal of this repository is to deploy Appsmith on Kubernetes in a simple and fast manner, without having to rely on Helm repositories. This integration uses the Docker images of Appsmith, Redis, and MongoDB, making everything configurable through the `config.yaml` files. This makes it incredibly flexible and easy to manipulate.

You can create your StatefulSets, namespaces, control replicas, set up environments for production, development, staging, testing, and establish a complete integration flow for your Appsmith applications, all in a highly scalable manner.

## Prerequisites

1. A Linux-based operating system (in this case, we use Ubuntu 22.04).
2. Kubernetes (K8s) - You can follow this installation guide: [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/).
3. Minikube - [Minikube Installation Guide](https://minikube.sigs.k8s.io/docs/start/).
4. Docker - [Docker Installation Guide](https://docs.docker.com/desktop/install/ubuntu/).
5. Visual Studio Code - [VS Code Installation Guide](https://code.visualstudio.com/).

## Getting Started

1. Install the requirements using the following script:

```bash
./install
```

1. To get started, run the following command:

```bash
./startminikube.sh && ./deploy.sh
```

2. Now, to monitor the deployment, run this command and wait for everything to come up successfully:


```bash
kubectl get pods -n appsmith
```

3. Perform a port forward of port 80 from the Appsmith pod.

```bash
kubectl port-forward $POD_NAME 8080:80 -n appsmith
```

You will see the containers starting up. If the Appsmith container takes too long to start (more than 15 minutes), execute this command:

```bash
kubectl delete pod <<Appsmith Pod Name>> --grace-period=0 --force -n appsmith
```
