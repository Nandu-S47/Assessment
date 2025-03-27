# purpose: Create a resource group

resource "azurerm_resource_group" "example" {
  name     = "${var.rg_name}-rg"
  location = var.rg_location
}

resource "azurerm_resource_group" "databricks" {
  name     = "${var.rg_name}-databricks-rg"
  location = var.rg_location
  
}