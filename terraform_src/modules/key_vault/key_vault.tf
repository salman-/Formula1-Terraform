data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = "${var.project_name}-keyvault"
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id_value
    object_id = "6d4f73a7-cd54-420e-a7d4-6dbe7ba690ef"

    key_permissions = [
      "Create",
      "Get",
      "Delete",
      "Purge",
      "List",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List",
    ]
  }
}

resource "azurerm_key_vault_secret" "client_id" {
  name         = "client-id"
  value        = var.client_id_value
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "client_secret" {
  name         = "client-secret"
  value        = var.client_secret_value
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "subscription_id" {
  name         = "subscription-id"
  value        = var.subscription_id_value
  key_vault_id = azurerm_key_vault.key_vault.id
}

resource "azurerm_key_vault_secret" "tenant_id" {
  name         = "tenant-id"
  value        = var.tenant_id_value
  key_vault_id = azurerm_key_vault.key_vault.id
}