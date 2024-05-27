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
