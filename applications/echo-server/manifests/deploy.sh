#!/bin/bash
set -euo pipefail

kubectl apply -f 000-namespace.yml
kubectl apply -f 001-echo-configmap.yml
kubectl apply -f 002-echo-deploy.yml
kubectl apply -f 003-echo-svc.yml
kubectl apply -f 004-echo-ingress.yml
# kubectl apply -f 005-echo-listenerset.yml
# kubectl apply -f 006-echo-httproute.yml
