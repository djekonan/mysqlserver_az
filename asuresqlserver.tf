
resource "azurerm_resource_group" "mysqlresgroup" {
  name     = "rs_mql_az"
  location = "canadacentral"
}

resource "azurerm_mssql_server" "azuresqlserver" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.databaserg.name
  location                     = azurerm_resource_group.databaserg.location
  version                      = "12.0"
 
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "00000000-0000-0000-0000-000000000000"
  }

  tags = {
    environment = "production"
  }
}
