provider "azurerm" {

  features {}
}

resource "azurerm_resource_group" "main_resource_group" {
  name     = "RG-Terraform-on-Azure"
  location = "West Europe"
}

module "storage_account" {
  source = "./modules/storage-account"
  vnet_name = azurerm_virtual_network.virtual_network.name
}

module "datafactory" {
  source = "./modules/data-factory"
}

module "databricks" {
  source = "./modules/data-bricks"

  resource_group_name     = azurerm_resource_group.main_resource_group.name
  resource_group_location = azurerm_resource_group.main_resource_group.location
  virtual_network_id      = azurerm_virtual_network.virtual_network.id
  vnet_name               = azurerm_virtual_network.virtual_network.name
}
/*
module "database" {
  source                  = "./modules/database"
  resource_group_name     = azurerm_resource_group.main_resource_group.name
  resource_group_location = azurerm_resource_group.main_resource_group.location
  vnet_name               = azurerm_virtual_network.virtual_network.name
}
*/