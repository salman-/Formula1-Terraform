resource "azurerm_storage_account" "storage_account" {
  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  account_kind                    = "StorageV2"
  is_hns_enabled                  = "true"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_data_lake_gen2_filesystem" "data_lake_storage" {
  name               = "rawdata"
  storage_account_id = azurerm_storage_account.storage_account.id
}

resource "azurerm_storage_data_lake_gen2_filesystem" "processed_data_storage" {
  name               = "processeddata"
  storage_account_id = azurerm_storage_account.storage_account.id
}