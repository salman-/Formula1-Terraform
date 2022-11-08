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

variable "client_id" {
  type =string
  default = "dd381b2e-4e26-4a29-96c8-0b625d6ad2e9"
}

variable "client_secret" {
  type =string
  default = "ead9c78c-61e0-44f6-9438-b8f1c5b95ae2"
}

variable "subscription_id" {
  type =string
  default = "48ee300d-8738-496a-9366-1271ebefc1e6"
}

variable "tenant_id" {
  type =string
  default = "1f2519d6-a33d-4336-abb5-8085bcb587d6"
}