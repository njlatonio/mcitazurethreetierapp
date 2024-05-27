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

variable "resourcegroup_name"{
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
