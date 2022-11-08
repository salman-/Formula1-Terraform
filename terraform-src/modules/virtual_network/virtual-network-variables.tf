variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "virtual_network_address_space" {
  default = "10.0.0.0/16"
}
variable "vnet_name" {
  type    = string
  default = "General-Virtual-Network"
}