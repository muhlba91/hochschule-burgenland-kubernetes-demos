#!/bin/bash
set -eou pipefail

helm repo add gitea https://dl.gitea.com/charts/ || true
# helm repo update

HELM_KUBECONTEXT=minikube helm upgrade --install \
  -n gitea-helm \
  --create-namespace \
  -f values.yml \
  gitea \
  gitea/gitea

# to expose gitea open the chosen method in a new terminal:
# - minikube service -n gitea-helm gitea-http --url
# - or use kubectl port-forward:
#   kubectl -n gitea-helm port-forward service/gitea-http 3000:3000
