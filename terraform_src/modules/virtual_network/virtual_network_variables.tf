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

variable "custom_subnet_ip_range" {
  default = "10.0.2.0/24"
}

variable "vnet_name" {
  type    = string
  default = "General-Virtual-Network"
}