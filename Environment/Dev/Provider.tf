terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3ace2f6c-7fad-4649-99ca-c60df54b9873"
}