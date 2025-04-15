terraform {
  required_version = ">= 1.8, < 2.0"
  # Specify the required providers and their versions
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"  # Source of the AzureRM provider
      version = "~> 4.16.0"          # Version of the AzureRM provider
    }
    fabric = {
      source  = "microsoft/fabric"
      version = "0.1.0-beta.7"
    }
  }
}

provider "azurerm" {
  features {}  # Enable all features for the AzureRM provider
  subscription_id = var.subscription_id  # Add your subscription ID here
}

provider "fabric" {}
