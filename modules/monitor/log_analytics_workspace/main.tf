resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.loganalytics_sku
  retention_in_days   = var.retention_in_days
}

resource "azurerm_monitor_diagnostic_setting" "monitor_diag" {
  name = var.monitor_diag_name
  target_resource_id = azurerm_log_analytics_workspace.example.id
  storage_account_id = var.logs_store_sg_id
}