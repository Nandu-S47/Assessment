output "sa_name_output" {
  value = azurerm_storage_account.sa.name
  
}

output "bootdiag_name_output" {
  value = azurerm_storage_account.bootdiag.name
  
}

output "bootdiag_primary_blob_endpoint" {
  value = azurerm_storage_account.bootdiag.primary_blob_endpoint
  
}