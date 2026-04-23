#! /bin/sh

set -e

# bootstrap the cluster and get the kubeconfig for the admin user
k0sctl apply --no-drain --config k0sctl.yml
k0sctl kubeconfig --config k0sctl.yml > ./admin.conf

# install cilium
helm repo add cilium https://helm.cilium.io/
helm repo update
helm install --kubeconfig=./admin.conf --namespace=cilium --create-namespace cilium cilium/cilium --values values-cilium.yml || true

# install path provisioner
kubectl --kubeconfig=./admin.conf apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl --kubeconfig=./admin.conf apply -f storageclass.yml
