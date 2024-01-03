terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean"{
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "do_k8s_cluster" {
  name    = var.k8s_cluster_name
  region  = var.region
  version = var.k8s_version

  # This default node pool is mandatory
  node_pool {
    name       = var.k8s_node_pool_name
    size       = var.k8s_node_size
    auto_scale = false
    node_count = var.k8s_node_count
    tags       = ["digitalocean"]
  }
}
