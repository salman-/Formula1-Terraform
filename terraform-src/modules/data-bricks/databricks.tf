resource "azurerm_databricks_workspace" "pandemic_databricks" {
  name                = var.databricks_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "standard"
}