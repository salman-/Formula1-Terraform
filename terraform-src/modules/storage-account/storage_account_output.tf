output "storage_account_subnet_id" {
  value = azurerm_subnet.storage_account_subnet.id
}

output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}