resource "azurerm_linux_virtual_machine" "example" {
  name                            = "test-virtual-machine"
  location                        = var.resource_group_location
  resource_group_name             = var.resource_group_name
  size                            = "Standard_F2"
  admin_username                  = var.virtual_machine_username
  admin_password                  = var.virtual_machine_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.virtual_machine_network_interface.id,]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "virtual_machine_network_interface" {
  name                = "vm_nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.virtual_network_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_subnet" "virtual_network_subnet" {
  name                 = "vm_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_ip_range]
}