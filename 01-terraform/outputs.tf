output "do_k8s_kubeconfig_dev" {
  sensitive = true
  value     = module.do_k8s_dev.kubeconfig
}

output "do_k8s_raw_kubeconfig_dev" {
  sensitive = true
  value     = module.do_k8s_dev.raw_kubeconfig
}

output "do_k8s_kubeconfig_prod" {
  sensitive = true
  value     = module.do_k8s_prod.kubeconfig
}

output "do_k8s_raw_kubeconfig_prod" {
  sensitive = true
  value     = module.do_k8s_prod.raw_kubeconfig
}
