resource "azurerm_network_security_group" "traffic_rules" {
  name                = "vm_traffic_rules"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  security_rule {
    name                       = "virtual_network_permission"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "private_nsg_asso" {
  subnet_id                 = azurerm_subnet.virtual_network_subnet.id
  network_security_group_id = azurerm_network_security_group.traffic_rules.id

}