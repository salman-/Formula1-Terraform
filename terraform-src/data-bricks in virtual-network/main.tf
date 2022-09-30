provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "demo" {
  name     = "RG-Terraform-on-Azure"
  location = "West Europe"
}

variable "environment" {
  default = "QA"
}

