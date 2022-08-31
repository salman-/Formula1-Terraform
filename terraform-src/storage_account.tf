resource "azurerm_storage_account" "state_storage_account" {
  name                     = "forexpriceperdictor"
  resource_group_name      = azurerm_resource_group.state_resource_group.name
  location                 = azurerm_resource_group.state_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "state_container" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.state_storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "state_blob" {
  name                   = "1.png"
  storage_account_name   = azurerm_storage_account.state_storage_account.name
  storage_container_name = azurerm_storage_container.state_container.name
  type                   = "Block"
  source                 = "./files/1.png"
}