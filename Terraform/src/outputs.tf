# Output the name of the resource group
output "resource_group_name" {
  value = azurerm_resource_group.example.name  # The name of the resource group
}

# Output the name of the storage account
output "storage_account_name" {
  value = azurerm_storage_account.example.name  # The name of the storage account
}

# Output the name of the storage container
output "storage_container_name" {
  value = azurerm_storage_container.example.name  # The name of the storage container
}

# Output the name of the MSSQL Server
output "sql_server_name" {
  value = azurerm_mssql_server.example.name  # The name of the SQL Server
}

# Output the name of the MSSQL Database
output "sql_database_name" {
  value = azurerm_mssql_database.example.name  # The name of the SQL Database
}

# Output the name of the Microsoft Fabric Capacity
output "fabric_capacity_name" {
  value = azurerm_fabric_capacity.example.name
}

output "fabric_workspace_name" {
  value = fabric_workspace.example.display_name
}
