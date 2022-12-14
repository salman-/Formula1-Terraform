variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "virtual_network_id" {
  type =string
  default = "To be set"
}

locals {
  prefix = "datafactory"
}