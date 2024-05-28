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
