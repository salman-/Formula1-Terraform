provider "azurerm" {

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
