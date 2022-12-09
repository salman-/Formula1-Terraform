data "azurerm_subscription" "primary" { }

data "azurerm_client_config" "client_config" { }

resource "azurerm_role_assignment" "roll_assignment" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.client_config.object_id
}