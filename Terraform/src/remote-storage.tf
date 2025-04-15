terraform {
  backend "azurerm" {
    resource_group_name  = "RGWorkshopUserName" # The name of the resource group for remote state storage
    storage_account_name = "examplestorageacctworkshop" # The name of the storage account for remote state storage
    container_name       = "tfstate"  # The name of the container for remote state storage
    key                  = "terraform.tfstate" # The key for the remote state file
  }
}
