#resource "azurerm_resource_group" "acr_rg" {
#  name     = var.resource_group_name
#  location = var.region
#
#  tags = {
#    env = "dev"
#    department = "acr"
#  }
#}


resource "azurerm_container_registry" "acr" {
  name                = "baaidemo1"
  resource_group_name = var.resource_group_name
  location            = var.region
  sku                 = "Standard"
  admin_enabled       = true
}


resource "azurerm_container_registry_scope_map" "scope_map" {
  name                    = "spring-scope-map"
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = var.resource_group_name
  actions = [
    "repositories/spring/content/read",
    "repositories/spring/content/write"
  ]
}

resource "azurerm_container_registry_token" "token" {
  name                    = "batoken"
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = var.resource_group_name
  scope_map_id            = azurerm_container_registry_scope_map.scope_map.id
}