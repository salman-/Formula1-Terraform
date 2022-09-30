resource "azurerm_databricks_workspace" "example" {
  name                = "databricks-test"
  resource_group_name = azurerm_resource_group.demo.name
  location            = azurerm_resource_group.demo.location
  sku                 = "standard"

  tags = {
    Environment = "Production"
  }
}