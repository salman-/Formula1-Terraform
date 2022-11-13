variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "vnet_name" {
  type = string
}

variable "subnet_ip_range" {
  type =string
}

variable "keyvault_name" {
  type =string
}

variable "client_id_value" {
  type =string
}

variable "client_secret_value" {
  type =string
}

variable "subscription_id_value" {
  type =string
}

variable "tenant_id_value" {
  type =string
}