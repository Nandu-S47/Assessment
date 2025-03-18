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

# Create private endpoint for Key Vault
resource "azurerm_private_endpoint" "akvprivateendpoint" {
  name                = var.private_endpoint_name
  location            = var.akv_location
  resource_group_name = var.akv_rg_name
  subnet_id           = var.akv_subnet1_id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = azurerm_key_vault.example.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = [azurerm_private_dns_zone.my_dns_zone.id]
  }
}

# Create private DNS zone
resource "azurerm_private_dns_zone" "my_dns_zone" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.akv_rg_name
}

# Create virtual network link
resource "azurerm_private_dns_zone_virtual_network_link" "my_privatedns_vnet_link" {
  name                  = var.prvdns_vnet_link_name
  resource_group_name   = var.akv_rg_name
  private_dns_zone_name = azurerm_private_dns_zone.my_dns_zone.name
  virtual_network_id    = var.vnet_id_to_link
}

resource "azurerm_monitor_diagnostic_setting" "akv_diag" {
  name = var.akvdiag_name
  target_resource_id = azurerm_key_vault.example.id
  storage_account_id = var.logs_store_sg_id
}