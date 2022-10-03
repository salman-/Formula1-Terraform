resource "azurerm_databricks_workspace" "forex_price_databricks" {
  name                = "databricks-test"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "standard"
}