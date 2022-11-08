resource "azurerm_public_ip" "public_ip_of_firewall_of_storage_account_subnet" {
  name                = "testpip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}