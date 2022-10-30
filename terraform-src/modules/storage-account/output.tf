output "storage_name" {
  value = azurerm_storage_account.storage_account
}

output "data_lake_name" {
  value = azurerm_storage_data_lake_gen2_filesystem.data_lake_storage
}