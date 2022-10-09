variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "vnet_name" {
  type = string
  default = "forex-price-vnet"
}

variable "virtual_network_id" {
  type =string
  default = "To be set"
}

locals {
  prefix_database = "database"
  prefix_database_server = "mssql-server"
}