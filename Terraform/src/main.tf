# Retrieve the client configuration of the AzureRM provider
data "azurerm_client_config" "example" {}

# Check the directory object type
data "azuread_directory_object" "example" {
  object_id = data.azurerm_client_config.example.object_id
}

# Get information about the Entra user
data "azuread_user" "example" {
  object_id = data.azurerm_client_config.example.object_id
}

# Local value to determine if the client is a user or not
locals {
  fabric_admin = can(data.azuread_directory_object.example.type == "User") ? data.azuread_user.example.user_principal_name : data.azurerm_client_config.example.object_id
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name  # Name of the resource group
  location = var.location             # Location of the resource group
}

# Create a storage account for remote state
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [azurerm_resource_group.example]  # Ensure resource group is created first
}

# Create a storage container for remote state
resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.example]  # Ensure storage account is created first
}

# Create an MSSQL Server
resource "azurerm_mssql_server" "example" {
  name                         = var.sql_server_name            # Name of the SQL Server
  resource_group_name          = azurerm_resource_group.example.name  # Resource group name
  location                     = azurerm_resource_group.example.location  # Location of the SQL Server
  version                      = "12.0"                         # SQL Server version
  administrator_login          = var.admin_username             # Administrator username
  administrator_login_password = var.admin_password             # Administrator password
  depends_on                   = [azurerm_resource_group.example]  # Ensure resource group is created first
}

# Add a null resource to introduce a delay
resource "null_resource" "wait_for_sql_server" {
  depends_on = [azurerm_mssql_server.example]

  provisioner "local-exec" {
    command = "Start-Sleep -Seconds 60"
    interpreter = ["PowerShell", "-Command"]
  }
}

# Create an MSSQL Database
resource "azurerm_mssql_database" "example" {
  name      = var.sql_database_name                   # Name of the SQL Database
  server_id = azurerm_mssql_server.example.id         # ID of the SQL Server
  sku_name  = "Basic"                                 # SKU name for the SQL Database
  depends_on = [null_resource.wait_for_sql_server]    # Ensure SQL Server is fully provisioned first
}

# Create Microsoft Fabric Capacity 
resource "azurerm_fabric_capacity" "example" {
  name                = "fc${var.solution_name}"
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location

  administration_members = setunion([local.fabric_admin], var.fabric_capacity_admin_upns)

  sku {
    name = var.fabric_capacity_sku
    tier = "Fabric"
  }
  depends_on = [azurerm_resource_group.example]  # Ensure resource group is created first
}

# Get the Fabric Capacity details
data "fabric_capacity" "example" {
  display_name = azurerm_fabric_capacity.example.name

  lifecycle {
    postcondition {
      condition     = self.state == "Active"
      error_message = "Fabric Capacity is not in Active state. Please check the Fabric Capacity status."
    }
  }
}

# Create a Fabric Workspace
resource "fabric_workspace" "example" {
  capacity_id  = data.fabric_capacity.example.id
  display_name = "ws-${var.solution_name}"
  depends_on   = [data.fabric_capacity.example]  # Ensure Fabric Capacity data source is available first
}
