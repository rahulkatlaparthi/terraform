terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dev"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "samplest56h"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "sample"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

variable "resource_group_name" {
  
  type        = string
}

variable "location" {
  type        = string
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

// resource "azurerm_private_endpoint" "example" {
//   name                = "ple-sql"
//   location            = "West Europe"
//   resource_group_name = "example-resources"
//   subnet_id           = "/subscriptions/aa8cf85a-4850-4a20-a36c-298efad14547/resourceGroups/example-resources/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"

//   private_service_connection {
//     name                           = "sqlserverple"
//     private_connection_resource_id = "/subscriptions/aa8cf85a-4850-4a20-a36c-298efad14547/resourceGroups/example-resources/providers/Microsoft.Sql/servers/mssqlserverrahul73"
//     is_manual_connection           = false
//     subresource_names=["sqlServer"]
//   }

// resource "azurerm_user_assigned_identity" "example" {
//   name="example-identity"
//   resource_group_name       = var.resource_group_name
//   location                  = var.location
  
// }

// resource "azurerm_storage_account" "storeacc" {
//   name                      = var.storage_account_name
//   resource_group_name       = var.resource_group_name
//   location                  = var.location
//   access_tier= var.access_tier
//   account_kind              = var.account_kind
//   account_tier              = var.account_tier
//   account_replication_type  = var.account_replication_type
//   enable_https_traffic_only = true
//   min_tls_version           = var.min_tls_version
//   tags                      = var.tags
//   identity{
//     type="UserAssigned"
//     identity_ids=[azurerm_user_assigned_identity.example.id]
//   }
//   depends_on=[azurerm_user_assigned_identity.example]
// }


// resource "azurerm_private_endpoint" "storageprivate" {
//   name                = "ple-storage"
//   location            = "West Europe"
//   resource_group_name = "example-resources"
//   subnet_id           = "/subscriptions/aa8cf85a-4850-4a20-a36c-298efad14547/resourceGroups/example-resources/providers/Microsoft.Network/virtualNetworks/example-network/subnets/service"

//   private_service_connection {
//     name                           = "storageple"
//     private_connection_resource_id = "/subscriptions/aa8cf85a-4850-4a20-a36c-298efad14547/resourceGroups/example-resources/providers/Microsoft.Storage/storageAccounts/rahulstg619"
//     is_manual_connection           = false
//     subresource_names=["blob"]
//   }
//    depends_on=[azurerm_storage_account.storeacc]
// }
// resource "azurerm_app_service_plan" "exampleappserviceplan" {
//   name                = var.app_service_plan
//   location            = var.location
//   resource_group_name = var.resource_group_name
//   kind                = var.app_service_plan_kind
//   reserved            = true

//   sku {
//     tier = var.app_service_plan_tier
//     size = var.app_service_plan_size
//   }
//   depends_on=[azurerm_user_assigned_identity.example]
// }

// resource "azurerm_app_service" "exampleappservice" {
//   name                = var.app_service_name
//   location            = var.location
//   resource_group_name = var.resource_group_name
//   app_service_plan_id = azurerm_app_service_plan.exampleappserviceplan.id

//   site_config {
//     linux_fx_version = "TOMCAT|9.0-java11"
//   always_on              = true
//   java_version           = "11"
//   java_container         = "JAVA"
//   java_container_version = "11"
//   }
//     identity{
//     type="UserAssigned"
//     identity_ids=[azurerm_user_assigned_identity.example.id]
//   }
//   depends_on=[azurerm_app_service_plan.exampleappserviceplan]


// }

// resource "azurerm_key_vault" "vault" {
//   name                       = "rahulkykeyvault"
//   location                   = var.location
//   resource_group_name        = var.resource_group_name
//   tenant_id="26c0f402-6550-45b8-a992-cc6da4656d81"

//   sku_name                   = var.sku_name
  
// }

// resource "azurerm_role_assignment" "example" {
//   scope                = azurerm_key_vault.vault.id
//   role_definition_name = "Key Vault Contributor"
//   principal_id         = "3f937f92-dc52-4994-8ee1-1fb52d1de42c"
//   depends_on=[azurerm_key_vault.vault]
// }

// resource "azurerm_key_vault_access_policy" "example" {
//   key_vault_id = azurerm_key_vault.vault.id
//   tenant_id    = azurerm_user_assigned_identity.example.tenant_id
//   object_id    = azurerm_user_assigned_identity.example.principal_id

//   key_permissions = [
//     "Get",
//   ]

//   secret_permissions = [
//     "Get",
//   ]
// }

// resource "azurerm_key_vault_key" "key" {
//   name = "samplekey"

//   key_vault_id = azurerm_key_vault.vault.id
//   key_type     = var.key_type
//   key_size     = var.key_size
//   key_opts     = var.key_ops

// }

// resource "azurerm_data_factory" "dafactory" {
//   name                = "rahadf69"
//   location            = var.location
//   resource_group_name = var.resource_group_name
//       identity{
//         type="UserAssigned"
//           identity_ids=[azurerm_user_assigned_identity.example.id]
//   }
//    depends_on=[azurerm_user_assigned_identity.example]
// }

// resource "azurerm_log_analytics_cluster" "example" {
//   name                = "example-cluster"
//   resource_group_name = var.resource_group_name
//   location            = var.location

//   identity {
//     type = "SystemAssigned"
//   }
// }

resource "azurerm_application_insights" "example" {
  name                = "tf-dev-appinsights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}


