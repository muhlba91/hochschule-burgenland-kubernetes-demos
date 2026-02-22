#!/bin/bash
set -eou pipefail

kubectl --context minikube delete -f 006-wordpress-svc.yml
kubectl --context minikube delete -f 005-wordpress-deploy.yml
kubectl --context minikube delete -f 004-wordpress-pvc.yml
kubectl --context minikube delete -f 003-mysql-svc.yml
kubectl --context minikube delete -f 002-mysql-sts.yml
kubectl --context minikube delete -f 001-mysql-secret.yml
kubectl --context minikube delete -f 000-namespace.yml
