resource "azurerm_subnet" "private_snet" {
  name                 = "keyvault-subnet-private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_ip_range]
}