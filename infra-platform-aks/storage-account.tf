#resource "azurerm_storage_account" "infr-aplatform-sa" {
#  name                     = "infraplatformsatfstate"
#  resource_group_name      = azurerm_resource_group.infra-platform-rg.name
#  location                 = azurerm_resource_group.infra-platform-rg.location
#  account_tier             = "Standard"
#  account_replication_type = "LRS"
#
#  tags = {
#    environment = var.environment
#  }
#}
#### create container in SA
#
#resource "azurerm_storage_container" "containertfstate" {
#  name                  = "tfstate"
#  storage_account_name  = azurerm_storage_account.infr-aplatform-sa.name
#  container_access_type = "private"
#}
#
#####