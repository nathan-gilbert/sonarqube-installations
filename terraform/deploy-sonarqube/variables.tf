variable "kube_config" {
  description = "Path to the kubeconfig file"
  type        = string
  default = "~/.kube/lke-config"
}
