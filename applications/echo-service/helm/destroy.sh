#!/bin/bash
set -eou pipefail

helm delete -n echo-helm echo
kubectl delete ns echo-helm
