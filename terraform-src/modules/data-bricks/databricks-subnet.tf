resource "azurerm_subnet" "private_snet" {
  name                 = "databricks-subnet-private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.2.0/24"]

}
/*
resource "azurerm_subnet" "public_snet" {
  name                 = "subnet-public"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.3.0/24"]

  delegation {
    name = "databrickspublicdelegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}*/