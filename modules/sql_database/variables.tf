/*variable "UserAssignedIdentity_name" {
  description = "The name of the user assigned identity"
  type        = string
  
}
*/
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "sqlserver_name" {
  description = "The name of the SQL Server"
  type        = string
  
}

variable "sql_ver" {
  description = "The version of the SQL Server"
  type        = string
  
}

variable "admin_login" {
  description = "The administrator login for the SQL Server"
  type        = string
  sensitive = true
  
}

variable "admin_login_password" {
  description = "The administrator login password for the SQL Server"
  type        = string
  sensitive = true
  
}

variable "sql_db_name" {
  description = "The name of the SQL Database"
  type        = string
  
}
/*
variable "lic_type" {
  type = string
  validation {
    condition     = contains(["baseprice", "licenseincluded"], lower(var.lic_type))
    error_message = "The lic_type must be one of 'baseprice' or 'licenseincluded'."
  }
}
*/
variable "max_size_gb" {
  description = "The maximum size of the SQL Database in gigabytes"
  type        = number
  
}

variable "sku_name" {
  type = string
  validation {
    condition     = contains(["Basic", "S0", "S1", "S2", "P1", "P2", "P3"], var.sku_name)
    error_message = "The sku_name must be one of 'Basic', 'S0', 'S1', 'S2', 'P1', 'P2', 'P3'."
  }
}

variable "sql_subnet1_id" {
  description = "The ID of the subnet for the SQL Server"
  type        = string
  
}

variable "private_endpoint_name" {
  description = "The name of the private endpoint"
  type        = string
  
}

variable "private_service_connection_name" {
  description = "The name of the private service connection"
  type        = string
  
}

variable "private_dns_zone_group_name" {
  description = "The name of the private DNS zone group"
  type = string

}

variable "prvdns_vnet_link_name" {
  description = "The name of the virtual network link"
  type        = string
  
}

variable "vnet_id_to_link" {
  description = "The ID of the virtual network to link"
  type        = string
  
}