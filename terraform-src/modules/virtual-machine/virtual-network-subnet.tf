resource "azurerm_subnet" "virtual_network_subnet" {
  name                 = "vm_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_ip_range]
}
/*
resource "azurerm_network_interface" "virtual_network_nic" {
  name                = "vm_nic"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.virtual_network_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}*/