variable "sa_name" {
  description = "The name of the storage account"
  type = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which the storage account will be created"
  type = string
  
}

variable "location" {
  description = "The location of the resource group in which the storage account will be created"
  type = string
  
}

variable "storage_account_tier" {
  description = "The storage account tier"
  type = string
  validation {
    condition = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "The storage account tier must be either Standard or Premium"
  }
  
}

variable "sg_replication_type" {
  description = "The storage account replication type"
  type = string
  validation {
    condition = contains(["LRS", "GRS", "RAGRS", "ZRS"], var.sg_replication_type)
    error_message = "The storage account replication type must be either LRS, GRS, RAGRS, or ZRS"
  }
  
}


variable "subnet_id" {
  description = "The ID of the subnet in which the private endpoint will be created"
  type = string
  
}

variable "private_connection_resource_id" {
  description = "The ID of the resource to which the private endpoint will connect"
  type = string
  
}

variable "sa_acc_diag_name" {
  description = "The name of the diagnostic setting for the storage account"
  type = string
  
}

variable "logs_store_sg_id" {
  description = "The ID of the storage account to store logs"
  type = string
  
}

variable "sg_account_kind" {
  description = "The kind of the storage account"
  type = string
  validation {
    condition = contains(["StorageV2", "BlobStorage", "Storage"], var.sg_account_kind)
    error_message = "The storage account kind must be either StorageV2, BlobStorage, or Storage"
  }
  
}

variable "hns_enable" {
  description = "Enable Hierarchical Namespace for the storage account"
  type = bool
  default = true
  validation {
    condition = var.hns_enable == true || var.hns_enable == false
    error_message = "The hns_enable variable must be a boolean value (true or false)"
  }
  
}

variable "adls_filesystem_name" {
  description = "The name of the ADLS filesystem"
  type = string
  validation {
    condition = length(var.adls_filesystem_name) > 0
    error_message = "The ADLS filesystem name must not be empty"
  }
  
}