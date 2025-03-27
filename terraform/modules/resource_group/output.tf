output "rg_name_output" {
  value = azurerm_resource_group.example.name
  
}

output "databricks_rg_name_output" {
  value = azurerm_resource_group.databricks.name
  
}