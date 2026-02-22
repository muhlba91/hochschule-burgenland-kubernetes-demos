#! /bin/sh

set -e

# destroy the cluster
terraform destroy -auto-approve
