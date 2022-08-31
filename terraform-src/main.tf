provider "azurerm" {
   features {}
}


resource "azurerm_resource_group" "state_resource_group" {
  name     = "RG-Terraform-on-Azure"
  location = "West Europe"
}
