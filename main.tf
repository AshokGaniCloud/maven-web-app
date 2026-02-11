terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0.0"
}

data "vault_generic_secret" "azurecreds" {

  path = "secret/azurecred"

}

provider "azurerm" {
  features {}

  client_id       = data.vault_generic_secret.azurecreds.data["azure_client_id"]
  client_secret   = data.vault_generic_secret.azurecreds.data["azure_client_secret"]
  tenant_id       = data.vault_generic_secret.azurecreds.data["azure_tenant_id"]
  subscription_id = data.vault_generic_secret.azurecreds.data["azure_subscription_id"]
}

resource "azurerm_resource_group" "rg" {
  name     = "vault-terrarg"
  location = "Central US"
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "vault-sqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = data.vault_generic_secret.azurecreds.data["username"]

  administrator_login_password = data.vault_generic_secret.azurecreds.data["password"]

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
