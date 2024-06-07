output "kube_config" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools."
  value       = module.aks_with_node_group.kube_config
  sensitive   = true
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL that is associated with the cluster"
  value       = module.aks_with_node_group.oidc_issuer_url
}



output "cluster_id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = module.aks_with_node_group.cluster_id
}

output "client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  value       = module.aks_with_node_group.client_certificate
  sensitive   = true
}

#output "kube_config" {
#  description = "Raw Kubernetes config to be used by kubectl and other compatible tools."
#  value       = module.aks_with_node_group.kube_config
#  sensitive   = true
#}
#
#output "oidc_issuer_url" {
#  description = "The OIDC issuer URL that is associated with the cluster"
#  value       = module.aks_with_node_group.oidc_issuer_url
#}

output "node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = module.aks_with_node_group.node_resource_group
}

output "node_resource_group_id" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = module.aks_with_node_group.node_resource_group_id
}
