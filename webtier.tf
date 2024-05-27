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

# Web Tier Virtual Machine
resource "azurerm_linux_virtual_machine" "web_vm" {
  name                = var.webvm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.webvm_size
  admin_username      = var.administrator_login
  admin_password      = var.administrator_login_password
  network_interface_ids = [
    azurerm_network_interface.web_nic.id,
  ]
  os_disk {
    caching              = var.webvm_os_disk_caching
    storage_account_type = var.webvm_os_disk_storage_account_type
  }
  source_image_reference {
    publisher = var.webvm_source_image_reference_publisher
    offer     = var.webvm_source_image_reference_offer
    sku       = var.webvm_source_image_reference_sku
    version   = var.webvm_source_image_reference_version
  }
}

resource "azurerm_network_interface" "web_nic" {
  name                = var.webnic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = var.webnic_ip_configuration_name
    subnet_id                     = azurerm_subnet.web.id
    private_ip_address_allocation = var.webnic_ip_configuration_private_ip_address_allocation
  }
}


