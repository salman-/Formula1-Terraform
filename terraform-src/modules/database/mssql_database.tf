resource "azurerm_mssql_server" "sql_server" {
  name                         = "${local.prefix_database_server}-${var.project_name}"
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  version                      = "12.0"
  administrator_login          = var.database_username
  administrator_login_password = var.database_password
}

resource "azurerm_mssql_database" "sql_database" {
  name         = "${local.prefix_database}-${var.project_name}"
  server_id    = azurerm_mssql_server.sql_server.id
  sku_name     = "Basic"
}
