

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
  account_tier             = "Standard"
  account_replication_type = "LRS"

  }

