resource "azurerm_cdn_profile" "example" {
  name                = var.cdn_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
}

resource "azurerm_cdn_endpoint" "example" {
  name                = var.cdn_endpoint_name
  profile_name        = azurerm_cdn_profile.example.name
  location            = var.location
  resource_group_name = var.resource_group_name

  origin {
    name      = var.origin_name
    host_name = var.origin_host_name
  }
}