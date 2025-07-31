terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {

    organization = "Terraforb-lab-azure"

    workspaces {
      name = "Hand-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
}

resource "azurerm_resource_group" "rg" {
  name     = "813-7cc8197c-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage" {
  source               = "app.terraform.io/Terraforb-lab-azure/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "marjanddd333www"
  # insert required variables here
}
