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
  default = "itIsNotUserName"
}
variable "pipeline_virtual_machine_password" {
  default = "N0!ItisN0tP0ssWorD"
}

variable "pipeline_database_username" {
  default = "itIsNotUserName"
}
variable "pipeline_database_password" {
  default = "N0!ItisN0tP0ssWorD"
}

variable "client_id_value" {
  default = ""
}

variable "client_secret_value" {
  default = ""
}

variable "subscription_id_value" {
  default = ""
}

variable "tenant_id_value" {
  default = ""
}