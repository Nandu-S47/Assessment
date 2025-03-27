variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
  
}

variable "location" {
  description = "The location/region where the Log Analytics Workspace should be created"
  type        = string
  
}

variable "rg_name" {
  description = "The name of the Resource Group in which the Log Analytics Workspace should be created"
  type        = string
  
}

variable "loganalytics_sku" {
  description = "The SKU of the Log Analytics Workspace"
  type        = string
  validation {
    condition     = var.loganalytics_sku == "PerGB2018" || var.loganalytics_sku == "Standalone"
    error_message = "The SKU must be either 'PerGB2018' or 'Standalone'"
  }
  
}

variable "retention_in_days" {
    description = "The retention period for the logs in days"
    type        = number
  
}

variable "monitor_diag_name" {
  description = "The name of the diagnostic setting for the Log Analytics Workspace"
  type        = string
  
}

variable "logs_store_sg_id" {
  description = "The ID of the storage account to store logs"
  type        = string
  
}