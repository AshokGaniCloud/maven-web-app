terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0.0"
}

/*
data "vault_generic_secret" "azurecreds" {

  path = "secret/azurecred"

}
*/

provider "azurerm" {
  features {}

  #client_id       = data.vault_generic_secret.azurecreds.data["azure_client_id"]
  #client_secret   = data.vault_generic_secret.azurecreds.data["azure_client_secret"]
  #tenant_id       = data.vault_generic_secret.azurecreds.data["azure_tenant_id"]
  #subscription_id = data.vault_generic_secret.azurecreds.data["azure_subscription_id"]

  client_id =  "0cb534c6-53fd-4b97-9b46-b0195c20a9f0"
  client_secret = "6x78Q~qEOsXORn-~aPI5Oihbm6u9E1go_IIqvbIn"
  tenant_id = "518f2d6f-cf79-4c7f-a1df-8e7429f0899c"
  subscription_id = "5d219be1-db90-4799-839c-acf0a15fecab"
}
