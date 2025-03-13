
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = modules.resource_group.output.name
  location                 = modules.resource_group.output.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }
}

