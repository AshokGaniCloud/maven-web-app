

resource "azurerm_resource_group" "rg" {
  name     = "vault-terrarg"
  location = "Central US"
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "vault-sqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"

  administrator_login_password = "Ashokgani@123"

}

resource "azurerm_mssql_database" "sqldb" {
  name         = "vault-db"
  server_id    = azurerm_mssql_server.sqlserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    env = "dev"
  }
}
