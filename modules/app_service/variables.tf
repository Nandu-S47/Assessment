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

