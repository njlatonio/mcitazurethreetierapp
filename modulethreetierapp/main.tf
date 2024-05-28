# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Subnets
resource "azurerm_subnet" "web" {
  name                 = var.webtier_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.webtier_address_prefixes
}
resource "azurerm_subnet" "app" {
  name                 = var.apptier_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.apptier_address_prefixes
}
 resource "azurerm_subnet" "db" {
  name                 = var.dbtier_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.dbtier_address_prefixes
} 

# Network Security Groups
resource "azurerm_network_security_group" "web_nsg" {
  name                = var.webtier_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_network_security_group" "app_nsg" {
  name                = var.apptier_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_network_security_group" "db_nsg" {
  name                = var.dbtier_nsg_name
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

resource "azurerm_network_security_rule" "app_allow_inbound" {
  resource_group_name = azurerm_resource_group.rg.name
  name                        = var.apptier_ns_rules_name
  priority                    = var.apptier_ns_rules_priority
  direction                   = var.apptier_ns_rules_direction
  access                      = var.apptier_ns_rules_access
  protocol                    = var.apptier_ns_rules_protocol
  source_port_range           = var.apptier_ns_rules_source_port_range
  destination_port_range      = var.apptier_ns_rules_destination_port_range
  source_address_prefix       = var.apptier_ns_rules_source_address_prefix
  destination_address_prefix  = var.apptier_ns_rules_destination_address_prefix
  network_security_group_name = azurerm_network_security_group.app_nsg.name
}

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

# Subnet Associations with NSGs
resource "azurerm_subnet_network_security_group_association" "web_assoc" {
  subnet_id                 = azurerm_subnet.web.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "app_assoc" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "db_assoc" {
  subnet_id                 = azurerm_subnet.db.id
  network_security_group_id = azurerm_network_security_group.db_nsg.id
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

# App Tier Virtual Machine
resource "azurerm_linux_virtual_machine" "app_vm" {
  name                = var.appvm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.appvm_size
  admin_username      = var.administrator_login
  admin_password      = var.administrator_login_password
  network_interface_ids = [
    azurerm_network_interface.app_nic.id,
  ]
  os_disk {
    caching              = var.appvm_os_disk_caching
    storage_account_type = var.appvm_os_disk_storage_account_type
  }
  source_image_reference {
    publisher = var.appvm_source_image_reference_publisher
    offer     = var.appvm_source_image_reference_offer
    sku       = var.appvm_source_image_reference_sku
    version   = var.appvm_source_image_reference_version
  }
}

resource "azurerm_network_interface" "app_nic" {
  name                = var.appnic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = var.appnic_ip_configuration_name
    subnet_id                     = azurerm_subnet.app.id
    private_ip_address_allocation = var.appnic_ip_configuration_private_ip_address_allocation
  }
}

# Database Tier - Azure Database for MySQL
resource "azurerm_mysql_server" "mysql" {
  name                = var.mysql_server_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  administrator_login = var.db_admin_username
  administrator_login_password = var.db_admin_password
  sku_name            = var.mysql_server_sku_name
  storage_mb          = var.mysql_server_storage_mb
  version             = var.mysql_server_version
  auto_grow_enabled   = var.mysql_server_auto_grow_enabled
  backup_retention_days = var.mysql_server_backup_retention_days
  geo_redundant_backup_enabled = var.mysql_server_geo_redundant_backup_enabled
  public_network_access_enabled = var.mysql_server_public_network_access_enabled
  ssl_enforcement_enabled       = var.mysql_server_ssl_enforcement_enabled

}

resource "azurerm_mysql_database" "exampledb" {
  name                = var.mysql_database_name
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = var.mysql_database_charset
  collation           = var.mysql_database_collation
}
