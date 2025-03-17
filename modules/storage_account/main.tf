

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

resource "random_id" "random_id" {
  byte_length = 8

}
# Create storage account for boot diagnostics
resource "azurerm_storage_account" "bootdiag" {
  name                     = "diag${random_id.random_id.hex}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = var.bootdiag_tier
  account_replication_type = upper(var.bootdiag_replication_type)
}

