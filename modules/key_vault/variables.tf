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