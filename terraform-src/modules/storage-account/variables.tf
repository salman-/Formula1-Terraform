variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "container_name" {
  type    = string
  default = "pandemicstorageaccount"
}

variable "datalake_name" {
  type    = string
  default = "rawpandemicdata"
}

variable "vnet_name" {
  type    = string
  default = "my-vnet"
}

variable "virtual_network_id" {
  type    = string
  default = "To be set"
}

locals {
  prefix = "datalake"
}