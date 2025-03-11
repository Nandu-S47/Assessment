provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = module.resource_group.output.resource_group_name
  location            = module.resource_group.location
  prefix              = var.resource_group_name
}

module "sql_database" {
  source              = "./modules/sql_database"
  resource_group_name = module.resource_group.output.resource_group_name
  location            = module.resource_group.location
  prefix              = var.resource_group_name
}

module "storage_account" {
  source              = "./modules/storage_account"
  resource_group_name = module.resource_group.output.resource_group_name
  location            = module.resource_group.output.location
  prefix              = var.resource_group_name
}

module "cdn" {
  source               = "./modules/cdn"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.location
  storage_account_name = module.storage_account.storage_account_name
  prefix               = var.resource_group_name
}

module "monitor" {
  source              = "./modules/monitor"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  app_service_id      = module.app_service.app_service_id
  prefix              = var.resource_group_name
}

module "key_vault" {
  source              = "./modules/key_vault"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  prefix              = var.resource_group_name
}
