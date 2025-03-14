/*resource "azurerm_network_security_group" "example" {
  name                = "${var.nsg_name}"
  location            = var.location
  resource_group_name = var.rg_name
}
*/
resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  subnet {
    name             = var.subnet1_name
    address_prefixes = [var.subnet1_address_prefix]
    
  }

  subnet {
    name             = var.subnet2_name
    address_prefixes = [var.subnet2_address_prefix]
    
  }

}
