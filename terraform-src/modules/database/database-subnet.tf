resource "azurerm_subnet" "database_subnet" {
  name                 = "${local.prefix_database_server}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.4.0/24"]
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_mssql_virtual_network_rule" "database_network_rule" {
  name      = "sql-vnet-rule"
  server_id = azurerm_mssql_server.sql_server_for_price_prediction.id
  subnet_id = azurerm_subnet.database_subnet.id
}