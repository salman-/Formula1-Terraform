
resource "azurerm_mssql_server" "sql_server_for_price_prediction" {
  name                         = "sqlserverforforex"
  resource_group_name          = var.resource_group_name
  location                     = var.resource_group_location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "sql_database_for_price_prediction" {
  name         = "sqldatabaseforforex"
  server_id    = azurerm_mssql_server.sql_server_for_price_prediction.id
  max_size_gb  = 4
  sku_name     = "basic"
}
