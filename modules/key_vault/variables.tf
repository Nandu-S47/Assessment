variable "akv_name" {
  description = "The name of the Azure Key Vault"
  type        = string
  
}

variable "akv_location" {
  description = "The location/region where the Azure Key Vault should be created"
  type        = string
  
}

variable "akv_rg_name" {
  description = "The name of the resource group in which the Azure Key Vault will be created"
  type        = string
  
}

variable "private_endpoint_name" {
  description = "The name of the private endpoint"
  type        = string
  
}

variable "akv_subnet1_id" {
  description = "The ID of the subnet in which the private endpoint will be created"
  type        = string
  
}

variable "private_service_connection_name" {
  description = "The name of the private service connection"
  type        = string  
  
}

variable "private_dns_zone_group_name" {
  description = "The name of the private DNS zone group"
  type        = string
  
}

variable "prvdns_vnet_link_name" {
  description = "The name of the private DNS zone virtual network link"
  type        = string
  
}

variable "vnet_id_to_link" {
  description = "The ID of the virtual network to link to the private DNS zone"
  type        = string
  
}

variable "akvdiag_name" {
  description = "The name of the Azure Key Vault diagnostic setting"
  type        = string
  
}

variable "logs_store_sg_id" {
  description = "The ID of the storage account to store logs"
  type        = string
  
}