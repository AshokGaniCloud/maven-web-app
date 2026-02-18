
/*
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
*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0" # Optional: pin to a specific major version
    }
  }
}

# The provider block configures the specified provider
provider "azurerm" {
  features {}
  client_id       = "bbaf74c1-946e-4070-bc02-69bef9d923f0"
  client_secret   = "vL.8Q~Pn8GZOJA3kaD2OqfFCl0JVOvyHyro-jbum"
  tenant_id       = "a9f4b704-5abf-44ad-aa7a-81ac52764712"
  subscription_id = "46916665-00ee-498a-8ac3-e3ddc9ed41a4"
}


resource "azurerm_resource_group" "app" {
  name     = "terrarg-app-dev"
  location = "eastus"
}


resource "azurerm_virtual_network" "packvnet" {
  name                = "packervnet"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  address_space       = ["10.70.0.0/16"]
  dns_servers         = ["10.70.0.4", "10.70.0.5"]

  tags = {
    env = "Development"
  }
}

resource "azurerm_subnet" "packsub" {
  name                 = "packersubnet"
  resource_group_name  = azurerm_resource_group.app.name
  virtual_network_name = azurerm_virtual_network.packvnet.name
  address_prefixes     = ["10.70.1.0/24"]

}

resource "azurerm_network_security_group" "packsg" {
  name                = "packersg"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name

  security_rule {
    name                       = "packallowall"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

   tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface" "app" {
  count               = 3
  name                = "nic-app-${count.index}"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.packsub.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "app" {
  count               = 3
  name                = "vm-app-${count.index}"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  size                =  "Standard_B4as_v2"
  admin_username      = "adminuser"

  network_interface_ids = [azurerm_network_interface.app[count.index].id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 30
  }

  # Reference the custom image from the gallery
   source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    Environment  = "production"
    ImageVersion = "1.0.0"
  }
}






