output "id" {
    value = azurerm_databricks_workspace.example.id
}

output "storage_account_identity" {
    value = azurerm_databricks_workspace.example.storage_account_identity
  
}

output "managedrgid" {
    value = azurerm_databricks_workspace.example.managed_resource_group_id
  
}

output "workspace_url" {
    value = azurerm_databricks_workspace.example.workspace_url
  
}

