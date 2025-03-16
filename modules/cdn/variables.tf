variable "cdn_name" {
  description = "The name of the CDN profile"
  type        = string
  
}

variable "location" {
  description = "The location/region where the CDN profile should be created"
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which the CDN profile should be created"
  type        = string
  
}

variable "sku" {
  description = "The pricing tier of the CDN profile"
  type        = string
  validation {
    condition     = contains(["Standard_Verizon", "Premium_Verizon", "Standard_Akamai", "Standard_Microsoft"], var.sku)
    error_message = "Invalid SKU"
  }
  
}

variable "cdn_endpoint_name" {
  description = "The name of the CDN endpoint"
  type        = string
  
}

variable "origin_name" {
  description = "The name of the origin"
  type        = string
  
}

variable "origin_host_name" {
  description = "The host name of the origin"
  type        = string
  
}