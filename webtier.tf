# Subnets
resource "azurerm_subnet" "web" {
  name                 = var.webtier_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.webtier_address_prefixes
}

# Network Security Groups
resource "azurerm_network_security_group" "web_nsg" {
  name                = var.webtier_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
