variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}

variable "do_kubeconfig_file_path" {
  description = "Path to DigitalOcean kubeconfig file"
  type        = string
  default     = "~/.kube/do-kubeconfig"
}

variable "aws_kubeconfig_file_path" {
    description = "Path to AWS kubeconfig file"
    type        = string
    default     = "~/.kube/aws-kubeconfig"
}
