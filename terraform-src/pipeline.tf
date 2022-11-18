provider "azurerm" {

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
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

module "virtual_machine" {
  source           = "./modules/virtual-machine"
  vnet_name        = module.virtual_network.virtual_network_name
  network_ip_range = module.virtual_network.virtual_network_ip_range
  subnet_ip_range  = "10.0.1.0/24"
  username         = "adminuser"
  password         = "adminuseR12345!"
}

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

  databricks_name         = "formula1-databricks"
}

module "datafactory" {
  source = "./modules/data-factory"
}

module "keyvault" {
  source = "./modules/key-vault"

  keyvault_name   = "formuleeinsvault"

  client_id_value       = var.clientId
  client_secret_value   = var.clientSecret
  subscription_id_value = var.subscriptionId
  tenant_id_value       = var.tenantId
}

module "database" {
  source                  = "./modules/database"
  resource_group_name     = azurerm_resource_group.main_resource_group.name
  resource_group_location = azurerm_resource_group.main_resource_group.location
}
/*
module "private_link" {
  source                           = "./modules/private_link"
  virtual_network_id               = module.virtual_network.virtual_network_id
  asset_name_which_use_endpoint    = module.storage_account.storage_account_name
  subnet_id                        = module.storage_account.storage_account_subnet_id
  name                             = "storage"
  zone_name                        = azurerm_private_dns_zone.dns_zone.name
  private_link_enabled_resource_id = module.storage_account.storage_account_id
  subresource_names                = ["blob"]
}
*/