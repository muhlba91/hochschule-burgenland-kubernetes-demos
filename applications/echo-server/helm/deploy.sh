#!/bin/bash
set -eou pipefail

helm upgrade --install \
  -n echo-helm \
  --create-namespace \
  echo \
  .
