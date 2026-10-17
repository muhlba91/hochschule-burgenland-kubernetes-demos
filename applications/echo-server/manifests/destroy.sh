#!/bin/bash
set -euo pipefail

# kubectl delete -f 006-echo-httproute.yml
# kubectl delete -f 005-echo-listenerset.yml
kubectl delete -f 004-echo-ingress.yml
kubectl delete -f 003-echo-svc.yml
kubectl delete -f 002-echo-deploy.yml
kubectl delete -f 001-echo-configmap.yml
kubectl delete -f 000-namespace.yml
