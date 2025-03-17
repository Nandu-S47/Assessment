
module "resource_group" {
  source = "./modules/resource_group"
  rg_name = "assessment"
  rg_location = "Central US"
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
  subnet3_name = "subnet3"
  subnet3_address_prefix = "10.0.3.0/24"
  bastion_subnet_prefix = "10.0.4.0/26"
  bastion_sku = "Standard"
}

module "vm" {
  source = "./modules/vm"
  location = "Central US"
  resource_group_name = module.resource_group.rg_name_output
  vm_subnet_id = module.virtualnetwork.subnet1_id
  private_ip_address_allocation = "Dynamic"
  vm_size = "Standard_DS1_v2"
  osdisk_name = "azosdisk"
  osdisk_type = "Standard_LRS"
  win_vm_name = "azwinvm"
  vm_username = "azadmin"
  bootdiag_primary_blob_endpoint = module.storage_account.bootdiag_primary_blob_endpoint
  
}


module "storage_account" {
  source = "./modules/storage_account"
  sa_name = "azapiwebapp"
  resource_group_name = module.resource_group.rg_name_output
  location = "Central US"
  storage_account_tier = "Standard"
  sg_replication_type = "LRS"
  private_connection_resource_id = module.storage_account.sa_id_output
  subnet_id = module.virtualnetwork.subnet3_id
  bootdiag_tier = "Standard"
  bootdiag_replication_type = "LRS"
  bootdiag_name = module.storage_account.bootdiag_name_output
}

module "key_vault" {
  source = "./modules/key_vault"
  akv_name = "azkvtest"
  akv_rg_name = module.resource_group.rg_name_output
  akv_location = "Central US"
  private_endpoint_name = "azkvprivateendpoint"
  akv_subnet1_id = module.virtualnetwork.subnet1_id
  private_service_connection_name = "azkvprvserviceconnection"
  private_dns_zone_group_name = "azprvdnszonegroup"
  prvdns_vnet_link_name = "azkvprvdnslink"
  vnet_id_to_link = module.virtualnetwork.vnet_id
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
  config_file = "${path.module}/api-app/config.json"
  appsrv_private_endpoint = "azappsrvprivateendpoint"
  appsrv_subnet1_id = module.virtualnetwork.subnet1_id
  private_service_connection_name = "azappsrvprvserviceconnection"
  private_dns_zone_group_name = "azprvdnszonegroup"
  private_dns_zone_id = module.private_dns_zone_group.private_dns_zone_id
  
}

module "private_dns_zone_group" {
  source = "./modules/private_dns_zone_group"
  resource_group_name = module.resource_group.rg_name_output
  prvdns_vnet_link_name = "azprvdnslink"
  vnet_id_to_link = module.virtualnetwork.vnet_id
  
}

module "sql_database" {
  source = "./modules/sql_database"
  sqlserver_name = "azsqlserver"
  resource_group_name = module.resource_group.rg_name_output
  location = "Central US"
  sql_ver = "12.0"
  admin_login = "az-sqladmin"
  admin_login_password = "module.sql_database.administrator_login_password"
  sql_db_name = "azsqldb"
  sku_name = "S0"
  max_size_gb = 2
  private_endpoint_name = "azsqlprvendpoint"
  sql_subnet1_id = module.virtualnetwork.subnet1_id
  private_service_connection_name = "azsqlprvserviceconnection"
  private_dns_zone_group_name = "azprvdnszonegroup"
  prvdns_vnet_link_name = "azsqlprvdnslink"
  vnet_id_to_link = module.virtualnetwork.vnet_id

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
