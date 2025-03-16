
module "resource_group" {
  source = "./modules/resource_group"
  rg_name = "aessesment"
  rg_location = "Central US"
}

module "storage_account" {
  source = "./modules/storage_account"
  sa_name = "azapiwebapp"
  resource_group_name = module.resource_group.rg_name_output
  location = "Central US"
}

module "key_vault" {
  source = "./modules/key_vault"
  akv_name = "azkvtest"
  akv_rg_name = module.resource_group.rg_name_output
  akv_location = "Central US"
}

module "virtualnetwork" {
  source = "./modules/connectivity/virtual_network"
  vnet_name = "azvnet1"
  rg_name = module.resource_group.rg_name_output
  location = "Central US"
  address_space = ["10.0.0.0/16"]
  subnet1_name = "subnet1"
  subnet1_address_prefix = "10.0.1.0/24"
  subnet2_name = "subnet2"
  subnet2_address_prefix = "10.0.2.0/24"
  nsg_name = "azvnet1-nsg"
  dns_servers = []
  
}

module "app_service" {
  source = "./modules/app_service"
  app_service_plan_name = "azappserviceplan"
  resource_group_name = module.resource_group.rg_name_output
  location = "Central US"
  sku_name = "S1"
  os_type = "windows"
  win_app_service_name = "azappservice"
  min_tls_version = "1.2"
  
}