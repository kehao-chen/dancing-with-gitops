module "do_k8s" {
  source   = "./digitalocean"
  do_token = var.do_token
}

resource "local_file" "do_kubeconfig" {
  content  = module.do_k8s.raw_kubeconfig
  filename = pathexpand(var.do_kubeconfig_file_path)
}
