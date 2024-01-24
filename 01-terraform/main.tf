module "do_k8s_dev" {
  source   = "./digitalocean"
  k8s_cluster_name = "do-k8s-cluster-dev"
  do_token = var.do_token
}

resource "local_file" "do_kubeconfig_dev" {
  content  = module.do_k8s_dev.raw_kubeconfig
  filename = pathexpand(var.do_kubeconfig_file_path_dev)
}

module "do_k8s_prod" {
  source   = "./digitalocean"
  k8s_cluster_name = "do-k8s-cluster-prod"
  do_token = var.do_token
}

resource "local_file" "do_kubeconfig_prod" {
  content  = module.do_k8s_prod.raw_kubeconfig
  filename = pathexpand(var.do_kubeconfig_file_path_prod)
}
