variable "win_vm_name" {
  description = "Name of the Windows Virtual Machine"
  type        = string
  
}

variable "location" {
  description = "Location of the Resource Group"
  type        = string
  
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  
}

variable "vm_subnet_id" {
  description = "ID of the subnet"
  type        = string
  
}

variable "private_ip_address_allocation" {
  description = "Private IP address allocation"
  type        = string
  validation {
    condition     = var.private_ip_address_allocation == "Static" || var.private_ip_address_allocation == "Dynamic"
    error_message = "Private IP address allocation must be either Static or Dynamic"
  }
  
}

variable "vm_username" {
  description = "Username of the Virtual Machine"
  type        = string
  
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  validation {
    condition     = var.vm_size == "Standard_DS1_v2" || var.vm_size == "Standard_DS2_v2" || var.vm_size == "Standard_DS3_v2"
    error_message = "The size of the Virtual Machine must be either Standard_DS1_v2, Standard_DS2_v2, or Standard_DS3_v2"
  }
  
}

variable "osdisk_name" {
  description = "Name of the OS disk"
  type        = string
  
}

variable "osdisk_type" {
  description = "Type of the OS disk"
  type        = string
  validation {
    condition     = var.osdisk_type == "Standard_LRS" || var.osdisk_type == "Premium_LRS"
    error_message = "The type of the OS disk must be either Standard_LRS or Premium_LRS"
  }
  
}

variable "bootdiag_primary_blob_endpoint" {
  description = "Primary blob endpoint of the boot diagnostics storage account"
  type        = string
  
}
