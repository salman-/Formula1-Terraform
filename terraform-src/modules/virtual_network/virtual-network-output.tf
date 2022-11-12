output "virtual_network_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "virtual_network_ip_range" {
  value = azurerm_virtual_network.virtual_network.address_space[0]
}

output "virtual_network_id" {
  value = azurerm_virtual_network.virtual_network.id
}