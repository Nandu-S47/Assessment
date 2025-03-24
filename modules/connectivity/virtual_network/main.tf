# Purpose: Create a Virtual Network with 3 subnets and Azure Bastion


# Create a network security group
resource "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

# Creates a vitrual network
resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

}

# Create a subnet1
resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet1_address_prefix]
  
}

# Create a subnet2
resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet2_address_prefix]
  
}

# Create a subnet3
resource "azurerm_subnet" "subnet3" {
  name                 = var.subnet3_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet3_address_prefix]
  
}

# Create Subnet for Azure Bastion
resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.bastion_subnet_prefix]
}

# Create Public IP for Azure Bastion
resource "azurerm_public_ip" "bastion_pip" {
  name                = "bastion-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = title(var.bastion_sku)
}

# Create Azure Bastion Host
resource "azurerm_bastion_host" "bastion" {
  name                = "example-bastion"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
}