resource "azurerm_databricks_workspace" "forex_price_databricks" {
  name                = "pandemic-databricks"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "standard"
  /*
  custom_parameters {
    virtual_network_id                                   = var.virtual_network_id
    public_subnet_name                                   = azurerm_subnet.public_snet.name
    public_subnet_network_security_group_association_id  = azurerm_network_security_group.public_empty_nsg.id
    private_subnet_name                                  = azurerm_subnet.private_snet.name
    private_subnet_network_security_group_association_id = azurerm_network_security_group.private_empty_nsg.id
  }*/
}