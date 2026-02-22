#!/bin/bash
set -eou pipefail

helm delete -n argocd argocd-apps
helm delete -n argocd argocd
kubectl delete ns argocd
kubectl delete ns wordpress-argocd
