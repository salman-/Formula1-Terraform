variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "virtual_network_address_space" {
  default = ""
}
variable "vnet_name" {
  type    = string
  default = "General-Virtual-Network"
}

variable "pipeline_virtual_machine_username" {
  default = "admin2022"
}
variable "pipeline_virtual_machine_password" {
  default = "AdminInH0me?!"
}

variable "pipeline_database_username" {
  default = "admin2022"
}
variable "pipeline_database_password" {
  default = "AdminInH0me?!"
}