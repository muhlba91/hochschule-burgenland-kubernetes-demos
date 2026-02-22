# Hochschule Burgenland - Kubernetes Demos

[![Build status](https://img.shields.io/github/actions/workflow/status/muhlba91/hochschule-burgenland-kubernetes-demos/pipeline.yml?style=for-the-badge)](https://github.com/muhlba91/hochschule-burgenland-kubernetes-demos/actions/workflows/pipeline.yml)
[![License](https://img.shields.io/github/license/muhlba91/hochschule-burgenland-kubernetes-demos?style=for-the-badge)](LICENSE.md)
[![](https://api.scorecard.dev/projects/github.com/muhlba91/hochschule-burgenland-kubernetes-demos/badge?style=for-the-badge)](https://scorecard.dev/viewer/?uri=github.com/muhlba91/hochschule-burgenland-kubernetes-demos)

Demo applications and infrastructure setup for the courses at FH Burgenland.

## Getting Started

### 1. Cluster Bootstrap

To start a cluster, run one of the following bootstrap scripts:

- **Minikube**: `./bootstrap/minikube.sh` (requires `minikube`)
- **k0s**: `./bootstrap/k0s/bootstrap.sh` (requires `k0sctl`)
- **GKE**: `./bootstrap/gke/bootstrap.sh` (requires `terraform` and `gcloud`)

### 2. Deployment Options

#### Manual Deployment (Kubectl or Helm)

Each application includes `deploy.sh` and `destroy.sh` scripts in their respective `manifests` or `helm` directories.

- **WordPress**: `applications/wordpress/`
- **Echo Service**: `applications/echo-service/`

#### GitOps with ArgoCD

To deploy using ArgoCD:

1. Deploy ArgoCD: `./argocd/[minikube|k0s|default]/deploy.sh`
2. Retrieve the admin password (printed at the end of the script).
3. Access the dashboard via `minikube tunnel` or `minikube service` (for local clusters) or via the external IP (for GKE).

## Applications

- **[WordPress](applications/wordpress/)**: A WordPress instance with a MySQL database (StatefulSet).
- **[Echo Service](applications/echo-service/)**: A simple echo application for testing deployments, HPA, and Ingress.

## Automation & CI

- **Linting**: All YAML files are linted via [GitHub Actions](.github/workflows/pipeline.yml).
- **Dependencies**: [Renovate](renovate.json) keeps container images and GitHub Actions up to date.
- **Standards**: Uses `.pre-commit-config.yaml` and `.yamllint` for code quality.
