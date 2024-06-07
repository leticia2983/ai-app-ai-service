#
#provider "azurerm" {
#  backend "azurerm" {
#    resource_group_name  = "RGinfra-platform-rg-prod11" # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
#    storage_account_name = "infratfstate12"             # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
#    container_name       = "tfstate"                    # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
#    key                  = "kv.tfstate"                 # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
#  }
#  features {}
#}

terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.96.0"
    }
  }
}


provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_key_vault" "example" {
  name                        = "ba1111145KV"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}