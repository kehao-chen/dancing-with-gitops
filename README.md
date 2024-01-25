# Dancing with GitOps

![Dancing with GitOps](./images/dancing-with-gitops.webp)

- Slides: [Dancing with GitOps | Gamma](https://gamma.app/public/Dancing-with-GitOps-661dv50xxd42yu0?mode=doc)
- Theme Song: [GitOps 之舞 | Suno](https://app.suno.ai/song/7046a8f6-7332-4df1-9853-327988443751/)
- Reference: [Heptabase](https://app.heptabase.com/w/afd2aca3d6d16a943ef65d35239b9f4ddac923bc2238874d44b47aaf9e3bc5d6?id=8368d25b-7201-40d3-aecc-bab2076aaf19)

## Prerequisites

需要安裝以下工具：

- Terraform: [Install | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/install)
- Kubectl: [Install Tools | Kubernetes](https://kubernetes.io/docs/tasks/tools/#kubectl)
- Helm: [Helm | Installing Helm](https://helm.sh/docs/intro/install/)

需要有 DigitalOcean 帳號，並且建立一組 Personal Access Token，再將 Token 設定到 Terraform 變數中：

```shell
MY_DO_TOKEN="YOUR_DIGITALOCEAN_PERSONAL_ACCESS_TOKEN"
echo 'do_token = "$MY_DO_TOKEN"' > 01-terraform/terraform.tfvars
```

## Setup

### 01. Create Kubernetes Clusters

透過 Terraform 在 DigitalOcean 上建立兩組 Kubernetes Cluster，用於模擬 Dev 與 Prod 環境：

```shell
terraform -chdir=01-terraform init
terraform -chdir=01-terraform apply
```

### 02. Install Required Applications

#### Install ArgoCD

依據 [ArgoCD 官方文件](https://argo-cd.readthedocs.io/en/stable/operator-manual/installation/)安裝 ArgoCD：

```shell
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
```

#### Install Nginx Ingress Controller

依據 [Nginx Ingress Controller 官方文件](https://kubernetes.github.io/ingress-nginx/deploy/#digital-ocean) 安裝 Nginx Ingress Controller：

```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.5/deploy/static/provider/do/deploy.yaml

# Dev 環境
kubectl apply -f 02-argocd-ingress/dev/argocd-ingress.yaml
# Prod 環境
kubectl apply -f 02-argocd-ingress/dev/argocd-ingress.yaml
```

#### Install Reloader

由於 `ConfigMap` 的變更不會觸發 Pod 重啟，因此需要安裝 Reloader 來監控 ConfigMap 的變更，
依據 [Reloader 官方文件](https://github.com/stakater/Reloader?tab=readme-ov-file#helm-charts) 安裝 Reloader：

```shell
helm repo add stakater https://stakater.github.io/stakater-charts
helm repo update
kubectl create namespace reloader
helm install -n reloader reloader stakater/reloader
```

### 03. Deploy Example Application Manually

手動部署 Example Application：

```shell
# Dev 環境
kubectl apply -k 03-kustomize-example/overlays/dev
# Prod 環境
kubectl apply -k 03-kustomize-example/overlays/prod
```

### 04. Deploy Example Application with ArgoCD

手動建立 ArgoCD Application（CRD），再由 ArgoCD 自動化部署 Example Application：

```shell
# Dev 環境
kubectl apply -f 04-argocd-crd/argocd-applications-dev.yaml
# Prod 環境
kubectl apply -f 04-argocd-crd/argocd-applications-prod.yaml
```
