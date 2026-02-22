#!/bin/bash
set -eou pipefail

HELM_KUBECONTEXT=minikube helm upgrade --install -n wordpress-helm --create-namespace -f values.yml wordpress oci://registry-1.docker.io/bitnamicharts/wordpress

# to expose wordpress open the chosen method in a new terminal:
# - minikube tunnel
# - minikube service -n wordpress-helm wordpress --url
