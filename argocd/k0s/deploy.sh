#!/bin/bash
set -eou pipefail

helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install -n argocd --create-namespace -f values.yml argocd argo/argo-cd
helm upgrade --install -n argocd -f values-apps.yml argocd-apps argo/argocd-apps

# to find the argocd admin password run:
echo "ArgoCD admin password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo)"
