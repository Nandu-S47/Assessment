resource "random_pet" "prefix" {
  length    = 2
  separator = "-"
}

resource "random_password" "password" {
    length           = 8
    special          = true
    override_special = "_%@"
  
}

# Create network interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "${random_pet.prefix.id}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vm_nic_configuration"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = title(var.private_ip_address_allocation)
  }
}

# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                  = "${var.win_vm_name}-vm"
  admin_username        = var.vm_username
  admin_password        = random_password.password.result
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  size                  = var.vm_size

  os_disk {
    name                 = var.osdisk_name
    caching              = "ReadWrite"
    storage_account_type = var.osdisk_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}

resource "azurerm_monitor_diagnostic_setting" "vm_diag" {
  name = var.vm_diag_name
  target_resource_id = azurerm_windows_virtual_machine.main.id
  storage_account_id = var.logs_store_sg_id

  enabled_log {
    category = "WindowsEventLog"
  }

  metric {
    category = "AllMetrics"
  }
}