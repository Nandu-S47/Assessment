resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name
  os_type             = title(var.os_type)
}

resource "azurerm_windows_web_app" "example" {
  name                = var.win_app_service_name
  resource_group_name = azurerm_service_plan.example.resource_group_name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  webdeploy_publish_basic_authentication_enabled = false

  
    app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }

    site_config {
    minimum_tls_version = var.min_tls_version
  }
}

