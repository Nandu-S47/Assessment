resource "azurerm_user_assigned_identity" "example" {
  name                = var.UserAssignedIdentity_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_mssql_server" "example" {
  name                         = var.sqlserver_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_ver
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_login_password
}

resource "azurerm_mssql_database" "example" {
  name         = var.sql_db_name
  server_id    = azurerm_mssql_server.example.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = title(var.lic_type)
  max_size_gb  = var.max_size_gb
  sku_name     = var.sku_name
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

    identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.example.id]
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}