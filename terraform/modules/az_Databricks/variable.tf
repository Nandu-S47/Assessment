variable "databricksname" {
  description = "The name of the Databricks workspace"
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Databricks workspace will be created"
  type        = string
  
}

variable "location" {
  description = "The location/region where the Databricks workspace will be created"
  type        = string
  
}

variable "sku_name" {
  description = "The SKU of the Databricks workspace"
  type        = string
  validation {
    condition     = contains(["standard", "premium", "trial"], var.sku_name)
    error_message = "Invalid SKU"
  }
  
}

variable "prefix" {
  description = "The prefix to be used for the Databricks workspace name"
  type        = string
  default = "testazcus"
  
}