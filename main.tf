terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {

    organization = "louafi"

    workspaces {
      name = "Hands_On_With_Terraform"
    }
  }

}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "80ea84e8-afce-4851-928a-9e2219724c69"
  #resource_provider_registrations = "test"    

}

resource "azurerm_resource_group" "rg" {
  name     = "813-62097d6f-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "lou-module" {
  source               = "app.terraform.io/louafi/lou-module/azurerm"
  version              = "1.0.0"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  environment          = "Production"
  storage_account_name = "stgrcai1510"
}


