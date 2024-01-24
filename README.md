# Dancing with GitOps

![Dancing with GitOps](./images/dancing-with-gitops.webp)

- Slides: [Dancing with GitOps | Gamma](https://gamma.app/public/Dancing-with-GitOps-661dv50xxd42yu0?mode=doc)
- Theme Song: [GitOps 之舞 | Suno](https://app.suno.ai/song/7046a8f6-7332-4df1-9853-327988443751/)
- Reference: [Heptabase](https://app.heptabase.com/w/afd2aca3d6d16a943ef65d35239b9f4ddac923bc2238874d44b47aaf9e3bc5d6?id=8368d25b-7201-40d3-aecc-bab2076aaf19)

## Prerequisites

- Terraform: [Install | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/install)
- Kubectl:

## Setup

### Create Kubernetes Clusters

```shell
cd ./01-terraform
terraform init
terraform apply
```

### Install ArgoCD

```shell
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
```

### Install Nginx Ingress Controller

```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.5/deploy/static/provider/do/deploy.yaml
```

```shell
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.3/cert-manager.yaml
```
