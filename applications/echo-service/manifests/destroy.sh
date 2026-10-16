#!/bin/bash
set -euo pipefail

# kubectl delete -f 005-echo-httproute.yml
# kubectl delete -f 004-echo-listenerset.yml
kubectl delete -f 003-echo-ingress.yml
kubectl delete -f 002-echo-svc.yml
kubectl delete -f 001-echo-deploy.yml
kubectl delete -f 000-namespace.yml
