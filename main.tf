
module "resource_group" {
  source = "./modules/resource_group"
  rg_name = "assessment"
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

module "sql_database" {
  source = "./modules/sql_database"
  UserAssignedIdentity_name = "azusrassignsqlid"
  sqlserver_name = "azsqlserver"
  resource_group_name = module.resource_group.rg_name_output
  location = "Central US"
  sql_ver = "12.0"
  admin_login = "az-sqladmin"
  admin_login_password = "P@ssw0rd1234"
  sql_db_name = "azsqldb"
  lic_type = "BasePrice"
  max_size_gb = 2
  sku_name = "S0"
  
}

module "cdn" {
  source = "./modules/cdn"
  cdn_name = "azcdn"
  location = "Central US"
  resource_group_name = module.resource_group.rg_name_output
  sku = "Standard_Microsoft"
  cdn_endpoint_name = "azcdnendpoint"
  origin_name = "azcdnorigin"
  origin_host_name = "azcdnorigin.azurewebsites.net"
  
}
