output "endpoint" {
  value = digitalocean_kubernetes_cluster.do_k8s_cluster.endpoint
}

output "kubeconfig" {
  sensitive = true
  value     = digitalocean_kubernetes_cluster.do_k8s_cluster.kube_config[0]
}

output "raw_kubeconfig" {
  sensitive = true
  value     = digitalocean_kubernetes_cluster.do_k8s_cluster.kube_config[0].raw_config
}

output "token" {
  sensitive = true
  value     = digitalocean_kubernetes_cluster.do_k8s_cluster.kube_config[0].token
}

output "ca_certificate" {
  sensitive = true
  value     = base64decode(digitalocean_kubernetes_cluster.do_k8s_cluster.kube_config[0].cluster_ca_certificate)
}
