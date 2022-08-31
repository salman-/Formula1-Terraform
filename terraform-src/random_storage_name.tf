resource "random_string" "storage_account_name" {

  length  = 14
  lower   = true
  numeric = false
  upper   = false
  special = false
}
