provider "azurerm" {  
          #version = "=2.20.0"  #version = "=0.13.1" 
           version = "=2.20.0"
		   version= "2.4.0"
           subscription_id = "2bb92624-217a-45f4-a6c0-9da57926d5bd" 
            tenant_id       = "01baeab8-27f4-42c6-b537-4d968a11298c"  
            client_id       = "914fdd58-40ba-470d-b959-586d7e517592"  
            features {}  
}
resource "azurerm_resource_group" "RS1" {
  name     = "Firstresource"
  location = "West Europe"
}