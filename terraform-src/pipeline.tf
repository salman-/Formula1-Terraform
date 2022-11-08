provider "azurerm" {

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "main_resource_group" {
  name     = "RG-Terraform-on-Azure"
  location = "West Europe"
}

module "virtual_network" {
  source                        = "./modules/virtual_network"
  vnet_name                     = "General-Virtual-Network"
  virtual_network_address_space = "10.0.0.0/16"
}

module "virtual_machine" {
  source           = "./modules/virtual-machine"
  vnet_name        = module.virtual_network.virtual_network_name
  network_ip_range = module.virtual_network.virtual_network_ip_range
  subnet_ip_range  = "10.0.1.0/24"
}
/*
module "storage_account" {
  source               = "./modules/storage-account"
  vnet_name            = module.virtual_network.virtual_network_name
  network_ip_range     = module.virtual_network.virtual_network_ip_range
  subnet_ip_range      = "10.0.2.0/24"
  storage_account_name = "formuleinsstorage"
}

module "databricks" {
  source = "./modules/data-bricks"

  resource_group_name     = azurerm_resource_group.main_resource_group.name
  resource_group_location = azurerm_resource_group.main_resource_group.location
  virtual_network_id      = azurerm_virtual_network.virtual_network.id
  vnet_name               = azurerm_virtual_network.virtual_network.name
  databricks_name         = "formula1-databricks"
  subnet_ip_prefix        = "10.0.2.0/24"
}

module "keyvault" {
  source = "./modules/key-vault"

  vnet_name       = azurerm_virtual_network.virtual_network.name
  keyvault_name   = "formuleeinsvault"
  subnet_ip_range = "10.0.3.0/24"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

module "datafactory" {
  source = "./modules/data-factory"
}

module "database" {
  source                  = "./modules/database"
  resource_group_name     = azurerm_resource_group.main_resource_group.name
  resource_group_location = azurerm_resource_group.main_resource_group.location
  vnet_name               = azurerm_virtual_network.virtual_network.name
}
*/