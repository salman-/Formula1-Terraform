resource "azurerm_storage_account" "storage_account" {
  name                     = "pandemicrawdata"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "data_lake_storage" {
  name               = "rawdata"
  storage_account_id = azurerm_storage_account.storage_account.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "config_file_container" {
  name                  = "urlofdatafiles"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "public"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_blob" "url_of_csv_data" {
  name                   = "config-file-data"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.config_file_container.name
  type                   = "Block"
  source                 = "./modules/storage-account/configFiles/ecdc_file_list.json"
}