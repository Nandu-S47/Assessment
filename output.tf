# Purpose: This file is used to output the values of the resources created in the main.tf file.
output "stgactnameoutput" {
  value = module.storage_account.sa_name_output
  
}

output "rgnameoutput" {
  value = module.resource_group.rg_name_output
  
}

output "vnetnameoutput" {
  value = module.virtualnetwork.vnet_name
  
}

output "vnetidoutput" {
  value = module.virtualnetwork.vnet_id
  
}

output "subnet1idoutput" {
  value = module.virtualnetwork.subnet1_id
  
}

output "subnet1addressprefixoutput" {
  value = module.virtualnetwork.subnet1_address_prefix_output
  
}

output "subnet2idoutput" {
  value = module.virtualnetwork.subnet2_id
  
}

output "subnet2addressprefixoutput" {
  value = module.virtualnetwork.subnet2_address_prefix_output
  
}

output "nsgidoutput" {
  value = module.virtualnetwork.nsg_id
  
}

output "appserviceplanidoutput" {
  value = module.app_service.app_service_id
  
}

output "defaulthostnameoutput" {
  value = module.app_service.default_hostname
  
}

output "possibleoutboundipaddressesoutput" {
  value = module.app_service.possible_outbound_ip_addresses
  
}
/*
output "sqlusrassigned_id" {
  value = module.sql_database.usrassigned_id
  
}

output "sqlclient_id" {
  value = module.sql_database.client_id
  
}

output "sqlprincipal_id" {
  value = module.sql_database.principal_id
  
}
*/
output "sqlserver_id" {
  value = module.sql_database.sqlserver_id
  
}

output "cdnidoutput" {
  value = module.cdn.cdn_id
  
}

output "cdnfqdnoutput" {
  value = module.cdn.cdn_fqdn
  
}
