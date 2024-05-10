terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
// resource "azurerm_resource_group" "example" {
//   name     = "example-resources"
//   location = "West Europe"
// }

// resource "azurerm_virtual_network" "example" {
//   name                = "example-network"
//   address_space       = ["10.0.0.0/16"]
//   location            = "West Europe"
//   resource_group_name = "example-resources"
// }

// resource "azurerm_subnet" "service" {
//   name                 = "service"
//   resource_group_name  = "example-resources"
//   virtual_network_name = "example-network"
//   address_prefixes     = ["10.0.1.0/24"]

//   enforce_private_link_service_network_policies = true
// }
// resource "azurerm_sql_server" "example" {
//   name                         = "mssqlserverrahul73"
//   resource_group_name          = "example-resources"
//   location                     = "Central India"
//   version                      = "12.0"
//   administrator_login          = "mradministrator"
//   administrator_login_password = "thisIsDog11"

//   tags = {
//     environment = "production"
//   }
// }

resource "azurerm_private_endpoint" "example" {
  name                = "ple-sql"
  location            = "Central India"
  resource_group_name = "example-resources"
  subnet_id           = "/subscriptions/aa8cf85a-4850-4a20-a36c-298efad14547/resourceGroups/example-resources/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"

  private_service_connection {
    name                           = "sqlserverple"
    private_connection_resource_id = "/subscriptions/aa8cf85a-4850-4a20-a36c-298efad14547/resourceGroups/example-resources/providers/Microsoft.Sql/servers/mssqlserverrahul73"
    is_manual_connection           = false
    subresource_names=["sqlServer"]
  }
}