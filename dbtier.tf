# Subnets
 resource "azurerm_subnet" "db" {
  name                 = var.dbtier_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.dbtier_address_prefixes
} 

# Network Security Groups
resource "azurerm_network_security_group" "db_nsg" {
  name                = var.dbtier_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
