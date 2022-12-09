variable "resource_group_name" {
  type    = string
  default = "RG-Terraform-on-Azure"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "project_name" {
  default = "project_name"
}


variable "client_id_value" {
  default = ""
}

variable "client_secret_value" {
  default = ""
}

variable "subscription_id_value" {
  default = ""
}

variable "tenant_id_value" {
  default = ""
}