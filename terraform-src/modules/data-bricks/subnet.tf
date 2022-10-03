resource "azurerm_subnet" "private_snet" {
  name                 = "subnet-private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.test_vnet.name
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
  virtual_network_name = azurerm_virtual_network.test_vnet.name
  address_prefixes     = ["10.0.2.0/24"]

  delegation {
    name = "databrickspublicdelegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
    }
  }
}