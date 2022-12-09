resource "azurerm_mssql_firewall_rule" "my_ip_rule" {
  name                = "my_ip_rule"
  server_id           = azurerm_mssql_server.sql_server.id
  start_ip_address    = "77.183.112.220"
  end_ip_address      = "77.183.112.220"
}

resource "azurerm_mssql_firewall_rule" "virtual_network_rule" {
  name                = "virtual_network_rule"
  server_id           = azurerm_mssql_server.sql_server.id
  start_ip_address    = "10.0.0.0"
  end_ip_address      = "10.0.255.255"
}