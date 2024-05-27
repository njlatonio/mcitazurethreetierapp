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

# Network Security Rules
resource "azurerm_network_security_rule" "db_allow_inbound" {
  resource_group_name = azurerm_resource_group.rg.name
  name                        = var.dbtier_ns_rules_name
  priority                    = var.dbtier_ns_rules_priority
  direction                   = var.dbtier_ns_rules_direction
  access                      = var.dbtier_ns_rules_access
  protocol                    = var.dbtier_ns_rules_protocol
  source_port_range           = var.dbtier_ns_rules_source_port_range
  destination_port_range      = var.dbtier_ns_rules_destination_port_range
  source_address_prefix       = var.dbtier_ns_rules_source_address_prefix
  destination_address_prefix  = var.dbtier_ns_rules_destination_address_prefix
  network_security_group_name = azurerm_network_security_group.db_nsg.name
}
