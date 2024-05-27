# Subnets
resource "azurerm_subnet" "app" {
  name                 = var.apptier_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.apptier_address_prefixes
}
