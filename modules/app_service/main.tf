resource "azurerm_app_service_plan" "asp" {
  name                = "${var.prefix}-appserviceplan"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "api_app" {
  name                = "${var.prefix}-apiapp"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    dotnet_framework_version = "v4.0"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}

output "app_service_id" {
  value = azurerm_app_service.api_app.id
}

output "app_service_plan_id" {
  value = azurerm_app_service_plan.asp.id
}
