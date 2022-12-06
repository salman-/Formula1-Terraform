resource "azurerm_mssql_server" "sql_server_for_price_prediction" {
  name                         = "${local.prefix_database_server}-${local.project_name}"
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  version                      = "12.0"
  administrator_login          = var.database_username
  administrator_login_password = var.database_password
}

resource "azurerm_mssql_database" "sql_database_for_pandemic_data" {
  name         = "${local.prefix_database}-${local.project_name}"
  server_id    = azurerm_mssql_server.sql_server_for_price_prediction.id
  sku_name     = "basic"
}
