variable "environment" {
  default = "prod"
}
variable "location" {
  default = "uae north"
}
variable "name" {
  default = "infra-platform-rg"
}

### create storage account


# invoke cluster module which creates resource group, vnet, subnets and aks cluter with a default nodepool
# by default cluster module also creates a nodepool named worker
module "vnet_and_subnets" {
  source = "./modules/vnet_and_subnets"

  # create resource group, vnet and subnet with the same name as cluster name
  resource_group_name = var.cluster_name
  vnet_name           = var.cluster_name
  subnet_name         = "aks-subnet"

  # location where the resources need to be created
  region = var.region

  address_space         = ["10.1.0.0/16"]
  subnet_address_prefix = ["10.1.0.0/24"]
}

module "acr" {
  source = "./modules/acr"

  region              = var.region
  resource_group_name = module.vnet_and_subnets.az_rg_name
}

# invoking aks module to create aks cluster and node group
module "aks_with_node_group" {
  # invoke aks module under modules directory
  source = "./modules/aks"

  cluster_name        = var.cluster_name
  k8s_version         = var.k8s_version
  region              = var.region
  dns_prefix          = var.cluster_name
  resource_group_name = module.vnet_and_subnets.az_rg_name
  az_subnet_id        = module.vnet_and_subnets.az_subnet_id
  nodepools           = var.nodepools
  acr_id              = module.acr.acr_id
}
