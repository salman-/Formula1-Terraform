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

variable "project_name" {
  default = "formulaeins"
}

variable "database_username" {
  default = "it_is_not_a real_UserN0me???"
}
variable "database_password" {
  default = "it_is_not_a real_P0SS???"
}