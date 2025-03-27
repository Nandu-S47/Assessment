output "nic_name" {
  value = azurerm_network_interface.vm_nic.name
  
}

output "vm_password" {
  value = random_password.password.result
  
}