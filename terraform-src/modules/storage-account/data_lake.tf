resource "azurerm_storage_data_lake_gen2_filesystem" "data_lake_storage" {
  name               = var.datalake_name
  storage_account_id = azurerm_storage_account.storage_account.id

  properties = {
    hello = "aGVsbG8="
  }
}
