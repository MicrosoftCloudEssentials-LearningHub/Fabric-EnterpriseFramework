# ----------------------------------
### Here is some sample data. Please make any necessary modifications. 
# ----------------------------------

# Variable for subscription ID
subscription_id = "" # Add your subscription id number 

# Resource group name
resource_group_name = "" # Add your desired RG name

# Location of the resources
location = "Central US"

# SQL Server configuration
sql_server_name = "usernamesqlserver" # replace username with your name 
admin_username  = "adminuser" # replace with your desired user name 
admin_password  = "P@ssw0rd1234"  # Make sure to use a strong password

# SQL Database name
sql_database_name = "workshopdbusername" # replace username with your name 

# Variables for remote state storage
storage_account_name = "storageacctworkshop01"
container_name       = "tfstate"

# Variable for administrator principal ID
admin_principal_id = ""

# Microsoft Fabric Capacity configuration
solution_name = "capacitynamews" # choose your capacity name
fabric_capacity_admin_upns = ["user-email-here", "another-user-email-here"]
fabric_capacity_sku = "F64" # Choose your SKU like F64
