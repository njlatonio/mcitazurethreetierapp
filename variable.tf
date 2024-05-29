variable "subscription_id"{
  type=string
}
variable "client_id"{
  type=string
}
variable "client_secret"{
  type=string
}
variable "tenant_id"{
  type=string
}

variable "resource_group_name"{
  type=string
}
variable "location"{
  type=string
}
variable "vnet_name"{
  type=string
}
variable "address_space"{
  type=list(string)
}
variable "webtier_name"{
  type=string
}
variable "webtier_address_prefixes"{
  type=list(string)
}
variable "apptier_name"{
  type=string
}
variable "apptier_address_prefixes"{
  type=list(string)
}
variable "dbtier_name"{
  type=string
}
variable "dbtier_address_prefixes"{
  type=list(string)
}
variable "webtier_nsg_name"{
  type=string
}
variable "apptier_nsg_name"{
  type=string
}
variable "dbtier_nsg_name"{
  type=string
}
variable "webtier_ns_rules_name_http"{
  type=string
}
variable "webtier_ns_rules_priority_http"{
  type=number
}
variable "webtier_ns_rules_direction"{
  type=string
}
variable "webtier_ns_rules_access"{
  type=string
}
variable "webtier_ns_rules_protocol"{
  type=string
}
variable "webtier_ns_rules_source_port_range"{
  type=string
}
variable "webtier_ns_rules_destination_port_range_http"{
  type=string
}
variable "webtier_ns_rules_source_address_prefix"{
  type=string
}
variable "webtier_ns_rules_destination_address_prefix"{
  type=string
}
variable "webtier_ns_rules_name_https"{
  type=string
}
variable "webtier_ns_rules_priority_https"{
  type=number
}
variable "webtier_ns_rules_destination_port_range_https"{
  type=string
}
variable "apptier_ns_rules_name"{
  type=string
}
variable "apptier_ns_rules_priority"{
  type=number
}
variable "apptier_ns_rules_direction"{
  type=string
}
variable "apptier_ns_rules_access"{
  type=string
}
variable "apptier_ns_rules_protocol"{
  type=string
}
variable "apptier_ns_rules_source_port_range"{
  type=string
}
variable "apptier_ns_rules_destination_port_range"{
  type=string
}
variable "apptier_ns_rules_source_address_prefix"{
  type=string
}
variable "apptier_ns_rules_destination_address_prefix"{
  type=string
}
variable "dbtier_ns_rules_name"{
  type=string
}
variable "dbtier_ns_rules_priority"{
  type=number
}
variable "dbtier_ns_rules_direction"{
  type=string
}
variable "dbtier_ns_rules_access"{
  type=string
}
variable "dbtier_ns_rules_protocol"{
  type=string
}
variable "dbtier_ns_rules_source_port_range"{
  type=string
}
variable "dbtier_ns_rules_destination_port_range"{
  type=string
}
variable "dbtier_ns_rules_source_address_prefix"{
  type=string
}
variable "dbtier_ns_rules_destination_address_prefix"{
  type=string
}

variable "webvm_name"{
  type=string
}
variable "webvm_size"{
  type=string
}
variable "administrator_login"{
  type=string
}
variable "administrator_login_password"{
  type=string
}
variable "webvm_os_disk_caching"{
  type=string
}
variable "webvm_os_disk_storage_account_type"{
  type=string
}
variable "webvm_source_image_reference_publisher"{
  type=string
}
variable "webvm_source_image_reference_offer"{
  type=string
}
variable "webvm_source_image_reference_sku"{
  type=string
}
variable "webvm_source_image_reference_version"{
  type=string
}

variable "webnic_name"{
  type=string
}
variable "webnic_ip_configuration_name"{
  type=string
}
variable "webnic_ip_configuration_private_ip_address_allocation"{
  type=string
}

variable "appvm_name"{
  type=string
}
variable "appvm_size"{
  type=string
}
variable "appvm_os_disk_caching"{
  type=string
}
variable "appvm_os_disk_storage_account_type"{
  type=string
}
variable "appvm_source_image_reference_publisher"{
  type=string
}
variable "appvm_source_image_reference_offer"{
  type=string
}
variable "appvm_source_image_reference_sku"{
  type=string
}
variable "appvm_source_image_reference_version"{
  type=string
}

variable "appnic_name"{
  type=string
}
variable "appnic_ip_configuration_name"{
  type=string
}
variable "appnic_ip_configuration_private_ip_address_allocation"{
  type=string
}

variable "mysql_server_name"{
  type=string
}
variable "db_admin_username"{
  type=string
}
variable "db_admin_password"{
  type=string
}
variable "mysql_server_sku_name"{
  type=string
}
variable "mysql_server_storage_mb"{
  type=number
}
variable "mysql_server_version"{
  type=string
}
variable "mysql_server_auto_grow_enabled"{
  type=bool
}
variable "mysql_server_backup_retention_days"{
  type=number
}
variable "mysql_server_geo_redundant_backup_enabled"{
  type=bool
}
variable "mysql_server_public_network_access_enabled"{
  type=bool
}
variable "mysql_server_ssl_enforcement_enabled"{
  type=bool
}
variable "mysql_database_name"{
  type=string
}
variable "mysql_database_charset"{
  type=string
}
variable "mysql_database_collation"{
  type=string
}
variable "three_tier_app_resource_group_name"{
  type=string
}
variable "three_tier_app_location"{
  type=string
}
variable "three_tier_app_count_resource_group_name"{
  type=string
}
variable "three_tier_app_count_location"{
  type=string
}
variable "instance_count" {
  type = number
}
