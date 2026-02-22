#!/bin/bash
set -eou pipefail

kubectl --context minikube apply -f 000-namespace.yml
kubectl --context minikube apply -f 001-mysql-secret.yml
kubectl --context minikube apply -f 002-mysql-sts.yml
kubectl --context minikube apply -f 003-mysql-svc.yml
kubectl --context minikube apply -f 004-wordpress-pvc.yml
kubectl --context minikube apply -f 005-wordpress-deploy.yml
kubectl --context minikube apply -f 006-wordpress-svc.yml

# to expose wordpress open the chosen method in a new terminal:
# - minikube tunnel
# - minikube service -n wordpress-manifests wordpress --url
