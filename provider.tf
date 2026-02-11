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
