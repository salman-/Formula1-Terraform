resource "azurerm_network_security_group" "private_empty_nsg" {
  name                = "${local.prefix}-firewall-private"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "private_nsg_asso" {
  subnet_id                 = azurerm_subnet.private_snet.id
  network_security_group_id = azurerm_network_security_group.private_empty_nsg.id
}

resource "azurerm_network_security_group" "public_empty_nsg" {
  name                = "${local.prefix}-firewall-public"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "public_nsg_asso" {
  subnet_id                 = azurerm_subnet.public_snet.id
  network_security_group_id = azurerm_network_security_group.public_empty_nsg.id
}