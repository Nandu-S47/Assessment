# purpose: Create SQL server and database with private endpoint and private DNS zone


/*
resource "azurerm_user_assigned_identity" "example" {
  name                = var.UserAssignedIdentity_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
*/

# Random password for SQL server
resource "random_password" "admin_password" {
  count       = var.admin_login_password == null ? 1 : 0
  length      = 20
  special     = true
  min_numeric = 1
  min_upper   = 1
  min_lower   = 1
  min_special = 1
}

locals {
  admin_password = try(random_password.admin_password[0].result, var.admin_login_password)
}

resource "azurerm_mssql_server" "example" {
  name                         = var.sqlserver_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_ver
  administrator_login          = var.admin_login
  administrator_login_password = local.admin_password
}

resource "azurerm_mssql_database" "example" {
  name         = var.sql_db_name
  server_id    = azurerm_mssql_server.example.id
  sku_name     = var.sku_name
  max_size_gb = var.max_size_gb


  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}

# Create private endpoint for SQL server
resource "azurerm_private_endpoint" "sqlprvendpoint" {
  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.sql_subnet1_id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = azurerm_mssql_server.example.id
    subresource_names              = ["sqlServer"]
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
  resource_group_name = var.resource_group_name
}

# Create virtual network link
resource "azurerm_private_dns_zone_virtual_network_link" "my_privatedns_vnet_link" {
  name                  = var.prvdns_vnet_link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.my_dns_zone.name
  virtual_network_id    = var.vnet_id_to_link
}

resource "azurerm_monitor_diagnostic_setting" "sqldb_diag" {
  name = var.sql_db_name
  target_resource_id = azurerm_mssql_database.example.id
  storage_account_id = var.logs_store_sg_id

  enabled_log {
    category = "SQLInsights"
  }
  
  enabled_log {
    category = "AutomaticTuning"
  }

  enabled_log {
    category = "queryStoreRuntimeStatistics"
  }

  enabled_log {
    category = "queryStoreWaitStatistics"
  }

  enabled_log {
    category = "databaseWaitStatistics"
  }

  enabled_log {
    category = "Errors"
  }

  enabled_log {
    category = "Timeouts"
  }

  enabled_log {
    category = "Blocks"
  }

  enabled_log {
    category = "Deadlocks"
  }

  metric {
    category = "Basic"
  }

}