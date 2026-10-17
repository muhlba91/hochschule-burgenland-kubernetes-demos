#!/bin/bash
set -eou pipefail

helm delete -n echo-helm echo || true
kubectl delete ns echo-helm --ignore-not-found
