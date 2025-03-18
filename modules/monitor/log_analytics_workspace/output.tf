output "log_analytics_workspace_id" {
  description = "The name of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.example.id
  
}