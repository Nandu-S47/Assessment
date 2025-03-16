output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.example.id
  
}

output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.example.id
  
}

output "vnet_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.example.name
  
}

output "vnet_rg_name" {
  description = "The name of the Resource Group"
  value       = azurerm_virtual_network.example.resource_group_name
  
}

output "vnet_rg_location" {
  description = "The location of the Resource Group"
  value       = azurerm_virtual_network.example.location
  
}

output "address_space" {
  description = "The address space of the Virtual Network"
  value       = azurerm_virtual_network.example.address_space
  
}

output "subnet1_id" {
  description = "The ID of the first subnet"
  value       = azurerm_subnet.subnet1.id
  
}

output "subnet2_id" {
  description = "The ID of the second subnet"
  value       = azurerm_subnet.subnet2.id
  
}

output "subnet1_address_prefix_output" {
  description = "The name of the first subnet"
  value       = azurerm_subnet.subnet1.address_prefixes
  
}
output "subnet2_address_prefix_output" {
  description = "The address prefix of the second subnet"
  value       = azurerm_subnet.subnet2.address_prefixes
  
}