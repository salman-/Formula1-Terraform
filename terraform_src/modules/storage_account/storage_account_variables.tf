variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "vnet_name" {
  type    = string
  default = "my-vnet"
}

variable "storage_account_name" {
  default = ""
}