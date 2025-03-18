variable "app_service_plan_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  
}

variable "os_type" {
  description = "The operating system type"
  type        = string
  
}

variable "sku_name" {
  description = "The SKU name"
  type        = string
  
}

variable "win_app_service_name" {
  description = "The name of the windows app service"
  type        = string
  
}

variable "min_tls_version" {
  description = "The minimum TLS version"
  type        = string
  default     = "1.2"
  
}

variable "config_file" {
  description = "Path to the configuration file"
  type        = string
  default     = "../api-app/config.json"
}

variable "appsrv_private_endpoint" {
  description = "The name of the private endpoint"
  type        = string
  
}

variable "appsrv_subnet1_id" {
  description = "The ID of the subnet"
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

variable "private_dns_zone_id" {
  description = "The ID of the private DNS zone"
  type        = string
  
}

variable "appsrv_diag_name" {
  description = "The name of the diagnostic setting"
  type        = string
  
}

variable "logs_store_id" {
  description = "The ID of the logs storage account"
  type        = string
  
}