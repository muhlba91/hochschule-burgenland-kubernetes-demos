#! /bin/sh

set -e

# destroy the cluster
k0sctl reset --config k0sctl.yml
