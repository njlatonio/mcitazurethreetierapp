resourcegroup_name="Mcitterraformrg"
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
