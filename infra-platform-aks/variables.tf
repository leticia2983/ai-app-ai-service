variable "region" {
  type        = string
  description = "aks region where the resources are being created"
}

variable "cluster_name" {
  type        = string
  description = "aks cluster name, same name is used for resource group, vnet and subnets"
  default     = "ba"
}

variable "k8s_version" {
  type        = string
  description = "k8s version"
  default     = "1.28.5"
}


variable "nodepools" {
  description = "Nodepools for the Kubernetes cluster"
  type = map(object({
    name                  = string
    zones                 = list(number)
    vm_size               = string
    enable_auto_scaling   = bool
    enable_node_public_ip = bool
    tags                  = map(string)
    node_labels           = map(string)
  }))
  default = {
    worker = {
      name                  = "worker"
      zones                 = [1, 2, 3]
      vm_size               = "Standard_D2_v2"
      enable_auto_scaling   = false
      enable_node_public_ip = true
      tags                  = { worker_name = "worker" }
      node_labels           = { "worker-name" = "worker" }
    }
    #    worker2 = {
    #      name                  = "ai"
    #      zones                 = [1, 2, 3]
    #      vm_size               = "Standard_D2_v2"
    #      enable_auto_scaling   = false
    #      enable_node_public_ip = true
    #      tags                  = { worker_name = "worker2" }
    #      node_labels           = { "worker-name" = "worker2" }
    #    }

  }
}