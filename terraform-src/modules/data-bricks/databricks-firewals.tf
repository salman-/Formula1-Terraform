/*
resource "azurerm_network_security_group" "private_empty_nsg" {
  name                = "firewall-private"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "private_nsg_asso" {
  subnet_id                 = azurerm_subnet.private_snet.id
  network_security_group_id = azurerm_network_security_group.private_empty_nsg.id
}*/