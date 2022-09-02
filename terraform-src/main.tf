provider "azurerm" {
  subscription_id = "48ee300d-8738-496a-9366-1271ebefc1e6"
  client_id       = "dd381b2e-4e26-4a29-96c8-0b625d6ad2e9"
  client_secret   = "S.48Q~hXPRC~gWNPDqLRE2YvIs8RY5jjQDN3na7I"
  tenant_id       = "1f2519d6-a33d-4336-abb5-8085bcb587d6"

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
