output "do_k8s_kubeconfig" {
  sensitive = true
  value     = module.do_k8s.kubeconfig
}

output "do_k8s_raw_kubeconfig" {
  sensitive = true
  value     = module.do_k8s.raw_kubeconfig
}
