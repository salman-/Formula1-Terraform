resource "azurerm_virtual_network" "test_vnet" {
  name                = "diconiumdatabricks"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}