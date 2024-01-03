variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}

variable "region" {
  description = "DigitalOcean region slug"
  type        = string
  default     = "sgp1"
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28.2-do.0"
}

variable "k8s_cluster_name" {
  description = "The name of the kubernetes cluster"
  type        = string
  default     = "do-k8s-cluster"
}

variable "k8s_node_pool_name" {
  description = "Initial node pool name"
  type        = string
  default     = "do-default-node-pool"
}

variable "k8s_node_size" {
  description = "Droplet node size"
  type        = string
  default     = "s-1vcpu-2gb"
}

variable "k8s_node_count" {
  description = "Number of droplets in the initial pool"
  type        = number
  default     = 1
}
