#!/bin/bash
set -eou pipefail

HELM_KUBECONTEXT=minikube helm upgrade --install -n wordpress-helm --create-namespace -f values.yml wordpress oci://registry-1.docker.io/bitnamicharts/wordpress

# to expose wordpress open the chosen method in a new terminal:
# - minikube tunnel
# - minikube service -n wordpress-helm wordpress --url
# or use kubectl port-forward:
# kubectl -n wordpress-helm port-forward service/wordpress 28015:443
