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

# Network Security Rules
resource "azurerm_network_security_rule" "web_allow_http" {
  resource_group_name = azurerm_resource_group.rg.name
  name                        = var.webtier_ns_rules_name_http
  priority                    = var.webtier_ns_rules_priority_http
  direction                   = var.webtier_ns_rules_direction
  access                      = var.webtier_ns_rules_access
  protocol                    = var.webtier_ns_rules_protocol
  source_port_range           = var.webtier_ns_rules_source_port_range
  destination_port_range      = var.webtier_ns_rules_destination_port_range_http
  source_address_prefix       = var.webtier_ns_rules_source_address_prefix
  destination_address_prefix  = var.webtier_ns_rules_destination_address_prefix
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

resource "azurerm_network_security_rule" "web_allow_https" {
  resource_group_name = azurerm_resource_group.rg.name
  name                        = var.webtier_ns_rules_name_https
  priority                    = var.webtier_ns_rules_priority_http
  direction                   = var.webtier_ns_rules_direction
  access                      = var.webtier_ns_rules_access
  protocol                    = var.webtier_ns_rules_protocol
  source_port_range           = var.webtier_ns_rules_source_port_range
  destination_port_range      = var.webtier_ns_rules_destination_port_range_https
  source_address_prefix       = var.webtier_ns_rules_source_address_prefix
  destination_address_prefix  = var.webtier_ns_rules_destination_address_prefix
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

