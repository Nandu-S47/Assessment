output "app_service_id" {
  value = azurerm_service_plan.example.id

}

output "default_hostname" {
  value = azurerm_windows_web_app.example.default_hostname
  
}

output "possible_outbound_ip_addresses" {
  value = azurerm_windows_web_app.example.possible_outbound_ip_addresses
  
}