data "local_file" "config" {
  filename = var.config_file
}

locals {
  config = jsondecode(data.local_file.config.content)
}

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
      app_command_line = local.config.app_cmd_line
      minimum_tls_version = var.min_tls_version
  }
}

resource "azurerm_private_endpoint" "appsrvprivateendpoint" {
  name                = var.appsrv_private_endpoint
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.appsrv_subnet1_id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = azurerm_windows_web_app.example.id
    subresource_names              = ["appsrv"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}
