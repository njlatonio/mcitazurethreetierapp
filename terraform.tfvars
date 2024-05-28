resource_group_name="Mcitterraformrg"
location="Canada Central"
vnet_name="myVNet"
address_space=["10.0.0.0/16"]
webtier_name="web-subnet"
webtier_address_prefixes=["10.0.1.0/24"]
apptier_name="app-subnet"
apptier_address_prefixes=["10.0.2.0/24"]
dbtier_name="db-subnet"
dbtier_address_prefixes=["10.0.3.0/24"]
webtier_nsg_name="web-nsg"
apptier_nsg_name="app-nsg"
dbtier_nsg_name="db-nsg"
webtier_ns_rules_name_http="allow-http"
webtier_ns_rules_priority_http=100
webtier_ns_rules_direction="Inbound"
webtier_ns_rules_access="Allow"
webtier_ns_rules_protocol="Tcp"
webtier_ns_rules_source_port_range="*"
webtier_ns_rules_destination_port_range_http="80"
webtier_ns_rules_source_address_prefix="*"
webtier_ns_rules_destination_address_prefix="*"
webtier_ns_rules_name_https="allow-https"
webtier_ns_rules_priority_https=101
webtier_ns_rules_destination_port_range_https="443"
apptier_ns_rules_name="allow-inbound"
apptier_ns_rules_priority=100
apptier_ns_rules_direction="Inbound"
apptier_ns_rules_access="Allow"
apptier_ns_rules_protocol="Tcp"
apptier_ns_rules_source_port_range="*"
apptier_ns_rules_destination_port_range="8080"
apptier_ns_rules_source_address_prefix="10.0.1.0/24"
apptier_ns_rules_destination_address_prefix="10.0.2.0/24"
dbtier_ns_rules_name="allow-inbound-db"
dbtier_ns_rules_priority=100
dbtier_ns_rules_direction="Inbound"
dbtier_ns_rules_access="Allow"
dbtier_ns_rules_protocol="Tcp"
dbtier_ns_rules_source_port_range="*"
dbtier_ns_rules_destination_port_range="3306"
dbtier_ns_rules_source_address_prefix="10.0.2.0/24"
dbtier_ns_rules_destination_address_prefix="10.0.3.0/24"
webvm_name="webVM"
webvm_size="Standard_B1s"
webvm_os_disk_caching="ReadWrite"
webvm_os_disk_storage_account_type="Standard_LRS"
webvm_source_image_reference_publisher="Canonical"
webvm_source_image_reference_offer="UbuntuServer"
webvm_source_image_reference_sku="18.04-LTS"
webvm_source_image_reference_version="latest"
webnic_name="webNIC"
webnic_ip_configuration_name="internal"
webnic_ip_configuration_private_ip_address_allocation="Dynamic"
appvm_name="appVM"
appvm_size="Standard_B1s"
appvm_os_disk_caching="ReadWrite"
appvm_os_disk_storage_account_type="Standard_LRS"
appvm_source_image_reference_publisher="Canonical"
appvm_source_image_reference_offer="UbuntuServer"
appvm_source_image_reference_sku="18.04-LTS"
appvm_source_image_reference_version="latest"
appnic_name="appNIC"
appnic_ip_configuration_name="internal"
appnic_ip_configuration_private_ip_address_allocation="Dynamic"
mysql_server_name="mysqlserver"
mysql_server_sku_name="GP_Gen5_2"
mysql_server_storage_mb=5120
mysql_server_version="5.7"
mysql_server_auto_grow_enabled=true
mysql_server_backup_retention_days=7
mysql_server_geo_redundant_backup_enabled=false
mysql_server_public_network_access_enabled=false
mysql_server_ssl_enforcement_enabled=true
mysql_database_name="exampledb"
mysql_database_charset="utf8"
mysql_database_collation="utf8_general_ci"
three_tier_app_resource_group_name="mcitthreetiermodule"
three_tier_app_location="West Europe"
