/*variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  
}
*/
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  
}

variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
  
}

variable "location" {
  description = "Location of the Resource Group"
  type        = string
  
}

variable "address_space" {
  description = "Address space of the Virtual Network"
  type        = list(string)
  
}

variable "dns_servers" {
  description = "DNS servers of the Virtual Network"
  type        = list(string)
  default = []
  
}

variable "subnet1_name" {
  description = "Name of the first subnet"
  type        = string
  
}

variable "subnet1_address_prefix" {
  description = "Address prefix of the first subnet"
  type        = string
  
}

variable "subnet2_name" {
  description = "Name of the second subnet"
  type        = string
  
}

variable "subnet2_address_prefix" {
  description = "Address prefix of the second subnet"
  type        = string
  
}
/*
variable "nsg_id" {
  description = "The ID of the Network Security Group"
  type        = string
  
}

variable "subnet2_nsg_id" {
  description = "The ID of the Network Security Group for the second subnet"
  type        = string
  default = null
  
}

variable "subnet1_nsg_id" {
  description = "The ID of the Network Security Group for the first subnet"
  type        = string
  default = null
}*/