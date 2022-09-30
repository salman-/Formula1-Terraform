resource "azurerm_network_security_group" "private_empty_nsg" {
  name                = "firewall-private"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}

resource "azurerm_subnet_network_security_group_association" "private_nsg_asso" {
  subnet_id                 = azurerm_subnet.private_snet.id
  network_security_group_id = azurerm_network_security_group.private_empty_nsg.id
}

resource "azurerm_network_security_group" "public_empty_nsg" {
  name                = "firewall-public"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}

resource "azurerm_subnet_network_security_group_association" "public_nsg_asso" {
  subnet_id                 = azurerm_subnet.public_snet.id
  network_security_group_id = azurerm_network_security_group.public_empty_nsg.id
}