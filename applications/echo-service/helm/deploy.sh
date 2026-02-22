#!/bin/bash
set -eou pipefail

helm install -n echo-helm --create-namespace echo .
