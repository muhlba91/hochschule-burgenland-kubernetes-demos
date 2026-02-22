#!/bin/bash
set -eou pipefail

kubectl apply -f 000-namespace.yml
kubectl apply -f 001-echo-deploy.yml
kubectl apply -f 002-echo-svc.yml
kubectl apply -f 003-echo-ingress.yml
