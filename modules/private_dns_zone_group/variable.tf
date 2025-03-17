variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "prvdns_vnet_link_name" {
  description = "The name of the private DNS virtual network link"
  type        = string
}

variable "vnet_id_to_link" {
  description = "The ID of the virtual network to link"
  type        = string
}