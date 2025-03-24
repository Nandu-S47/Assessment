# purpose: Create a resource group

resource "azurerm_resource_group" "example" {
  name     = "${var.rg_name}-rg"
  location = var.rg_location
}