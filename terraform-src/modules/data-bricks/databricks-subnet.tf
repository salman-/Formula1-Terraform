resource "azurerm_subnet" "private_snet" {
  name                 = "subnet-private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "databricksprivatermdelegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}

resource "azurerm_subnet" "public_snet" {
  name                 = "subnet-public"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_ip_prefix]

  delegation {
    name = "databrickspublicdelegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}