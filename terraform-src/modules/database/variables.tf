variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

locals {
  prefix_database = "database"
  prefix_database_server = "mssql-server"
}