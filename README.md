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

Applications are available using different Kubernetes deployment approaches:

- **Raw Kubernetes manifests**: Learn Kubernetes primitives directly using `kubectl apply`.
- **Helm**: Package and deploy applications using Helm charts.
- **GitOps with ArgoCD**: Manage application deployments declaratively using Git.

### Manual Deployment (Kubectl or Helm)

Each application includes `deploy.sh` and `destroy.sh` scripts in their respective `manifests` or `helm` directories.

Applications currently included:

- **Gitea** (`applications/gitea/`): Git hosting with a PostgreSQL database demonstrating Deployments, StatefulSets, Services, Secrets, and Persistent Volumes.
- **Echo Service** (`applications/echo-service/`): A lightweight HTTP application demonstrating Deployments, Services, Ingress, Gateway API, HTTPRoute, and ListenerSet resources.
- **Echo Server** (`applications/echo-server/`): A lightweight HTTP application demonstrating Deployments, ConfigMaps, Services, Ingress, Gateway API, HTTPRoute, and ListenerSet resources.
- **GCS Reader** (`applications/gcs-reader/`): A simple application demonstrating access to Google Cloud Storage using Kubernetes manifests.

### GitOps with ArgoCD

To deploy using ArgoCD:

1. Deploy ArgoCD:

   ```bash
   ./argocd/[minikube|default]/deploy.sh
   ```

2. Retrieve the initial admin password (printed at the end of the deployment script).

3. Access the ArgoCD UI:

   - **Minikube**: `minikube tunnel` or `minikube service`
   - **Other clusters**: Use the external IP or ingress of the ArgoCD server

## Gateway API

The Gateway API examples demonstrate a separation of responsibilities:

- **Gateway**: Managed by the platform or cluster administrator.
- **ListenerSet**: Defines application-specific listeners.
- **HTTPRoute**: Defines application-specific routing rules.

This separation allows infrastructure and application teams to work independently while using the Gateway API.

## Automation & CI

GitHub Actions automatically validates all changes on pull requests and pushes to the `main` branch.

The pipeline includes the following checks:

- **Commit Messages**: Pull requests are validated against the Conventional Commits specification using `conform`.
- **YAML Linting**: All YAML files are checked with `yamllint`.
- **Helm Validation**:
  - Helm chart dependencies are resolved.
  - Helm charts are validated using `helm lint`.
  - Helm charts are rendered using `helm template`.
- **Kubernetes Validation**:
  - Raw Kubernetes manifests are validated using `kubeconform`.
  - Rendered Helm manifests are also validated using `kubeconform`.
- **Terraform Validation**: Infrastructure code is checked using `tflint`.

## Dependency Management

[Renovate](renovate.json) automatically keeps GitHub Actions, container images, and Helm chart dependencies up to date.

## Code Quality

The repository uses:

- `.pre-commit-config.yaml` for local pre-commit hooks.
- `.yamllint` for YAML style and formatting rules.

## Development

Tool versions (Helm, kubeconform, tflint) are managed with [mise](https://mise.jdx.dev): run `mise trust` and `mise install` once, then use the usual commands (`helm lint`, `kubeconform`, `tflint`).
