variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "prefix" {
  type    = string
  default = "demo"
}

variable "vnet_name" {
  type    = string
  default = "General-Virtual-Network"
}