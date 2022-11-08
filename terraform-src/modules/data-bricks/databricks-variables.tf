variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "storage_account_name" {
  type    = string
  default = "forexpricestorageaccount"
}

variable "datalake_name" {
  type    = string
  default = "datalake"
}

variable "vnet_name" {
  type    = string
  default = "my-vnet"
}

variable "virtual_network_id" {
  type    = string
  default = "To be set"
}

variable "subnet_ip_prefix" {
  default = "10.0.2.0/24"
}

variable "databricks_name" {
  default = "formula1-databricks"
}