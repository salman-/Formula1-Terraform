data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.keyvault_name
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id

  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]

  }

}

resource "azurerm_key_vault_secret" "client_id" {
  name         = "clientId"
  value        = var.client_id
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "client_secret" {
  name         = "clientSecret"
  value        = var.client_secret
  key_vault_id = azurerm_key_vault.key_vault.id

}

resource "azurerm_key_vault_secret" "subscription_id" {
  name         = "subscriptionId"
  value        = var.subscription_id
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "tenant_id" {
  name         = "tenantId"
  value        = var.tenant_id
  key_vault_id = azurerm_key_vault.key_vault.id
}