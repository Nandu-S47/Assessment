resource "random_string" "random" {
  length  = 8
  special = false
  upper = false
  
}

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "example" {
  name                        = "${lower(var.akv_name)}${random_string.random.result}"
  location                    = var.akv_location
  resource_group_name         = var.akv_rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}