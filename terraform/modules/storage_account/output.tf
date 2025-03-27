output "sa_name_output" {
  value = azurerm_storage_account.sa.name
  
}

output "sa_id_output" {
  value = azurerm_storage_account.sa.id
  
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa.primary_web_endpoint
}

output "logs_storage_account_id" {
  value = azurerm_storage_account.log_storage.id
  
}