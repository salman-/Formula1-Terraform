resource "azurerm_data_factory" "data_factory" {
  name                = "formulaeinsdatafactory"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  #public_network_enabled = false

  identity {
    type = "SystemAssigned"
  }

  github_configuration {
    account_name    = "salman-"
    branch_name     = "main"
    git_url         = "https://github.com/salman-/Formula1-DataFactory"
    repository_name = "main"
    root_folder     = "/"
  }

  lifecycle {
    prevent_destroy = true
  }
}