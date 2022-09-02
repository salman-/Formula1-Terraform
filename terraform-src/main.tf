provider "azurerm" {
  #subscription_id = var.subscription_id
  #client_id       = var.client_id
  #client_secret   = var.client_secret
  #tenant_id       = var.tenant_id

  features {}

}

resource "azurerm_resource_group" "state_resource_group" {
  name     = "RG-Terraform-on-Azure"
  location = "West Europe"
}

variable "subscription_id" {
  default = ""
}
variable "client_id" {
  default = ""
}
variable "client_secret" {
  default = ""
}
variable "tenant_id" {
  default = ""
}
