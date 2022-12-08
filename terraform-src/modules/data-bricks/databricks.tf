resource "azurerm_databricks_workspace" "databricks" {
  name                = "${var.databricks_name}-databricks"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "standard"

  lifecycle {
    prevent_destroy = true
  }
}