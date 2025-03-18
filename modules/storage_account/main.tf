

terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper = false
  
}
resource "azurerm_storage_account" "sa" {
  name                     = "${lower(var.sa_name)}${random_string.random.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = title(var.storage_account_tier)
  account_replication_type = upper(var.sg_replication_type)

  }

resource "azurerm_storage_container" "web" {
  name                  = "$web"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "web_app" {
  name                   = "angular-web-app.zip"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.web.name
  type                   = "Block"
  source                 = "${path.module}/angular-app/hsp86gpv--run.zip"
}

resource "azurerm_storage_account_static_website" "test" {
  storage_account_id = azurerm_storage_account.sa.id
  error_404_document = "index.html"
  index_document     = "index.html"
}

resource "azurerm_private_endpoint" "storage_private_endpoint" {
  name                = "${var.sa_name}-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

    private_service_connection {
    name                           = "${var.sa_name}-privatelink"
    private_connection_resource_id = var.private_connection_resource_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}

resource "azurerm_monitor_diagnostic_setting" "sa_acc_diag" {
  name = var.sa_acc_diag_name 
  target_resource_id = azurerm_storage_account.sa.id
  storage_account_id = var.logs_store_sg_id

    enabled_log {
    category = "StorageRead"
  }
  
    enabled_log {
    category = "StorageWrite"
  }
  
    enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "AllMetrics"
  }
}

# Create storage account for logs storage
resource "random_string" "randomlogsa" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_storage_account" "log_storage" {
  name                     = "logstorage${random_string.randomlogsa.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "logs" {
  name                  = "logs"
  storage_account_id    = azurerm_storage_account.log_storage.id
  container_access_type = "private"

}