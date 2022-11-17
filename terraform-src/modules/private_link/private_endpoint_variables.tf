variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "private_link_enabled_resource_id" {
  type = string
}

variable "subresource_names" {
  type = list(string)
}

variable "virtual_network_id" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "asset_name_which_use_endpoint" {
  type = string
}