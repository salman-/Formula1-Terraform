terraform {

  backend "azurerm" {
    resource_group_name  = "RG-Terraform-on-Azure"
    storage_account_name = "formuleinsstorage"
    container_name       = "stateholder"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
   features {}
}

resource "azurerm_resource_group" "main_resource_group" {
  name     = "RG-Terraform-on-Azure"
  location = "West Europe"
}

module "virtual_network" {
  source                        = "./modules/virtual_network"
  vnet_name                     = "general_virtual_network"
  virtual_network_address_space = "10.0.0.0/16"
}
/*
module "virtual_machine" {
  source           = "./modules/virtual-machine"
  vnet_name        = module.virtual_network.virtual_network_name
  network_ip_range = module.virtual_network.virtual_network_ip_range
  subnet_ip_range  = "10.0.1.0/24"

  virtual_machine_username = var.pipeline_virtual_machine_username
  virtual_machine_password = var.pipeline_virtual_machine_password
}
*/
module "storage_account" {
  source               = "./modules/storage-account"
  vnet_name            = module.virtual_network.virtual_network_name
  storage_account_name = "formuleinsstorage"
}

module "databricks" {
  source = "./modules/data-bricks"

  resource_group_name     = azurerm_resource_group.main_resource_group.name
  resource_group_location = azurerm_resource_group.main_resource_group.location

  databricks_name = "formulaeins"
}

module "datafactory" {
  source = "./modules/data-factory"
}

module "keyvault" {
  source = "./modules/key-vault"

  project_name = "formulaeinsabc"
}

module "database" {
  source = "./modules/database"

  resource_group_name     = azurerm_resource_group.main_resource_group.name
  resource_group_location = azurerm_resource_group.main_resource_group.location
  database_username       = var.pipeline_database_username
  database_password       = var.pipeline_database_password

  project_name = "formulaeins"
}

/*
# Storage account private link
module "private_link" {
  source                           = "./modules/private_link"
  virtual_network_id               = module.virtual_network.virtual_network_id
  asset_name_which_use_endpoint    = module.storage_account.storage_account_name
  subnet_id                        = module.virtual_network.virtual_subnet_id
  name                             = "storage"
  zone_name                        = azurerm_private_dns_zone.dns_zone.name
  private_link_enabled_resource_id = module.storage_account.storage_account_id
  subresource_names                = ["blob"]
}*/