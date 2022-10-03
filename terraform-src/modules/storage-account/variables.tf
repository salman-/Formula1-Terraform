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