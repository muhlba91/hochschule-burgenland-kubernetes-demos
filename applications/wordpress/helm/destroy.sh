#!/bin/bash
set -eou pipefail

HELM_KUBECONTEXT=minikube helm delete -n wordpress-helm wordpress
kubectl --context minikube delete ns wordpress-helm
