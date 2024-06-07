terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.98.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "fdc87e1b-fe51-4e2"
  client_secret   = "d698Q~EZGsk7N_P7iqa"
  tenant_id       = "90f8a8f8-fcda-40f9-9b"
  subscription_id = "714bac87-66c7-4f7b-b"
}

## connect to SA

terraform {
  backend "azurerm" {
    resource_group_name  = "RGinfra-platform-rg-prod"
    storage_account_name = "infraplatformsatfstate"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

