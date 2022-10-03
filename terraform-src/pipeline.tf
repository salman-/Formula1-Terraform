provider "azurerm" {

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "main_resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "storage_account" {
  source = "./modules/storage-account"
}

module "datafactory" {
  source = "./modules/data-factory"
}

module "databricks" {
  source = "./modules/data-bricks"
}

module "database" {
  source = "./modules/database"
}