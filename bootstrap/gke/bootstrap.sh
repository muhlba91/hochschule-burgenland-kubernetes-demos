#! /bin/sh

set -e

# bootstrap the cluster and get the kubeconfig for the admin user
terraform apply -auto-approve
gcloud container clusters get-credentials "$(terraform output -raw kubernetes_cluster_name)" --zone "$(terraform output -raw zone)" --project "$(terraform output -raw project_id)"
