resource "azurerm_data_factory" "data_factory" {
  name                = "formulaeinsdatafactory"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  #public_network_enabled = false

  lifecycle {
    prevent_destroy = true
  }
}