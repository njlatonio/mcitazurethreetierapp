# Subnets
 resource "azurerm_subnet" "db" {
  name                 = var.dbtier_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.dbtier_address_prefixes
} 
