output "sa_name_output" {
  value = azurerm_storage_account.sa.name
  
}

output "sa_id_output" {
  value = azurerm_storage_account.sa.id
  
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa.primary_web_endpoint
}

output "bootdiag_name_output" {
  value = azurerm_storage_account.bootdiag.name
  
}

output "bootdiag_primary_blob_endpoint" {
  value = azurerm_storage_account.bootdiag.primary_blob_endpoint
  
}