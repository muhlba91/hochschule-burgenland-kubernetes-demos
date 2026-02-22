#!/bin/bash
set -eou pipefail

HELM_KUBECONTEXT=minikube helm delete -n argocd argocd-apps
HELM_KUBECONTEXT=minikube helm delete -n argocd argocd
kubectl --context minikube delete ns argocd
kubectl --context minikube delete ns wordpress-argocd
