resource "azurerm_private_endpoint" "endpoint" {
  name                = format("%s-%s", var.name, "private-endpoint")
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = format("%s-%s", var.name, "private-service-connection")
    private_connection_resource_id = var.private_link_enabled_resource_id
    is_manual_connection           = false
    subresource_names              = var.subresource_names
  }
}

resource "azurerm_private_dns_a_record" "dns_a" {
  name                = var.asset_name_which_use_endpoint
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = 10
  records             = [azurerm_private_endpoint.endpoint.private_service_connection.0.private_ip_address]
}