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
variable "webtier_ns_rules_name"{
  type=string
}
variable "webtier_ns_rules_priority"{
  type=number
}
variable "webtier_ns_rules_direction"{
  type=number
}
variable "webtier_ns_rules_access"{
  type=number
}
variable "webtier_ns_rules_protocol"{
  type=number
}
variable "webtier_ns_rules_source_port_range"{
  type=number
}
variable "webtier_ns_rules_destination_port_range"{
  type=number
}
variable "webtier_ns_rules_source_address_prefix"{
  type=number
}
variable "webtier_ns_rules_destination_address_prefix"{
  type=number
}
