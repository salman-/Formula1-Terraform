resource "azurerm_subnet" "storage_account_subnet" {
  name                 = "storage_account_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_ip_range]
}