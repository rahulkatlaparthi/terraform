provider "azurerm" {  
          #version = "=2.20.0"  #version = "=0.13.1" 
           version = "=2.20.0"
		   
           subscription_id = "26c0f402-6550-45b8-a992-cc6da4656d81" 
            tenant_id       = "26c0f402-6550-45b8-a992-cc6da4656d81"  
            client_id       = "12820d3c-c69e-400a-a835-e194068d8363"  
            features {}  
}
resource "azurerm_resource_group" "RS1" {
  name     = "Firstresource"
  location = "West Europe"
}