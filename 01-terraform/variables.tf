variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}

variable "do_kubeconfig_file_path_dev" {
  description = "Path to DigitalOcean kubeconfig file for Dev environment"
  type        = string
  default     = "~/.kube/do_kubeconfig_dev"
}

variable "do_kubeconfig_file_path_prod" {
    description = "Path to AWS kubeconfig file for Prod environment"
    type        = string
    default     = "~/.kube/do_kubeconfig_prod"
}
