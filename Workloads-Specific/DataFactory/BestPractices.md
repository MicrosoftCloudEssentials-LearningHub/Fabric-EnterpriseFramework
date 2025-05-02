# Azure Data Factory (ADF) - Best Practices Overview

Costa Rica

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com)
[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-21

----------

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Automated enterprise BI](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/data/enterprise-bi-adf)
- [Data warehousing and analytics](https://learn.microsoft.com/en-us/azure/architecture/example-scenario/data/data-warehouse)
- [Pipeline Logic 1: Error Handling and Best Effort Step](https://techcommunity.microsoft.com/blog/azuredatafactoryblog/pipeline-logic-1-error-handling-and-best-effort-step/3712168)
- [Source control in Azure Data Factory](https://learn.microsoft.com/en-us/azure/data-factory/source-control)
- [Register a Microsoft Entra app and create a service principal](https://learn.microsoft.com/en-us/entra/identity-platform/howto-create-service-principal-portal#option-3-create-a-new-client-secret)
- [Accessing Azure KeyVault secret for Fabric CopyData Action](https://community.fabric.microsoft.com/t5/Data-Warehouse/Accessing-Azure-KeyVault-secret-for-Fabric-CopyData-Action/m-p/3710317)
- [Use Azure Key Vault secrets in pipeline activities - ADF](https://learn.microsoft.com/en-us/azure/data-factory/how-to-use-azure-key-vault-secrets-pipeline-activities)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Architecture examples](#architecture-examples)
- [Best Practices for ADF Pipelines](#best-practices-for-adf-pipelines)
  - [Clear Pipeline Structure](#clear-pipeline-structure)
    - [Example Pipeline Structure](#example-pipeline-structure)
  - [Parameterization](#parameterization)
  - [Incremental Loading](#incremental-loading)
    - [Use Timestamps](#use-timestamps)
    - [Change Data Capture CDC](#change-data-capture-cdc)
    - [Delta Loads](#delta-loads)
    - [Partitioning](#partitioning)
  - [Error Handling and Monitoring](#error-handling-and-monitoring)
    - [a. Use If Condition Activity](#a-use-if-condition-activity)
    - [b. Configure Activity Fault Tolerance](#b-configure-activity-fault-tolerance)
    - [c. Custom Error Handling: Use Web Activity for error handling](#c-custom-error-handling-use-web-activity-for-error-handling)
    - [d. Pipeline Monitoring: Monitor activity runs.](#d-pipeline-monitoring-monitor-activity-runs)
  - [Security Measures](#security-measures)
  - [Use Azure Key Vault](#use-azure-key-vault)
    - [Store Secrets](#store-secrets)
    - [Access Policies](#access-policies)
    - [Secure Access](#secure-access)
    - [Rotate Secrets](#rotate-secrets)
  - [Source Control](#source-control)
  - [Resource Management](#resource-management)
  - [Testing and Validation](#testing-and-validation)
  - [Documentation](#documentation)
  - [Regular Updates](#regular-updates)
  - [Performance Tuning](#performance-tuning)
- [Recommended Training Modules on Microsoft Learn](#recommended-training-modules-on-microsoft-learn)

</details>

## Architecture examples

<img width="550" alt="image" src="https://github.com/user-attachments/assets/42bbf7f5-eb6d-455b-886d-d8f665f0dfa0">

<img width="550" alt="image" src="https://github.com/user-attachments/assets/2c06eaaf-3689-48f3-8e97-7c9c128800d9">

## Best Practices for ADF Pipelines

### Clear Pipeline Structure

> Ensure your pipelines are well-organized and easy to understand.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Consistent Naming Conventions** | Use clear and descriptive names for pipelines, activities, datasets, and linked services. | - Instead of `Pipeline1`, use `CopySalesDataPipeline`. <br/> - Name datasets like `SalesDataSource` and `SalesDataSink`. <br/> - Use descriptive names for activities like `ExtractSalesData` and `LoadSalesData`. |
| **Modular Design**            | Break down complex workflows into smaller, reusable pipelines.                  | - Create separate pipelines for data extraction, transformation, and loading (ETL). <br/> - Use a master pipeline to orchestrate the execution of these smaller pipelines. |
| **Annotations and Comments**  | Add descriptions and comments to activities and pipelines.                     | - Add an annotation to a Copy Data activity: `Copy sales data from SQL to Blob Storage`. <br/> - Use comments to explain complex logic or business rules within the pipeline. |
| **Parameterization**          | Use parameters to make your pipelines more flexible and easier to manage.       | - Define parameters for source and destination paths, allowing the same pipeline for different datasets. <br/> - Use parameters for file names, dates, and other dynamic values. |
| **Organized Layout**          | Arrange activities in a logical sequence and avoid overlapping lines.           | - Place activities in a left-to-right or top-to-bottom flow to visually represent the data flow. <br/> - Group related activities together and use containers for better organization. |
| **Error Handling and Logging**| Include error handling and logging activities to capture and manage errors.     | - Add a Web Activity to log errors to a monitoring system. <br/> - Use Try-Catch blocks to handle errors gracefully and ensure the pipeline continues running. |

#### Example Pipeline Structure

> Pipeline: CopySalesDataPipeline

**Activities**:

```mermaid
graph TD
    A[LookupFiles] --> B[ForEachFile]
    B --> C[CopySalesData]
    B --> D[LogStatus]
```

1. **Lookup Activity**: Fetch the list of files to be processed.
   - **Name**: `LookupFiles`
   - **Annotation**: `Fetch list of sales data files from source`

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/61e5a71a-3907-474a-8756-df41296c2ea7" />

2. **ForEach Activity**: Iterate over the list of files.
   - **Name**: `ForEachFile`
   - **Annotation**: `Process each sales data file`

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/e2a40a3f-df76-44f8-9aee-fe3690702abc" />

   - If needed, add parameters:

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/25dd5c13-f1ed-4af1-954f-377044672741" />

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/9844e3f7-f2a9-4440-8328-0a8415ccfaea" />

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/ac56189f-124b-4bd8-a304-b5add3c19ef0" />

   - **Activities Inside ForEach**:
     - **Copy Data Activity**: Copy data from source to destination.
       - **Name**: `CopySalesData`
       - **Annotation**: `Copy sales data from SQL to Blob Storage`
       - **Parameters**: `SourcePath`, `DestinationPath`

           <img width="550" alt="image" src="https://github.com/user-attachments/assets/b8da3d5a-137a-4482-850a-4e642b4828c2" />

           <img width="550" alt="image" src="https://github.com/user-attachments/assets/2eb0a163-6aa0-4a2f-9eec-2242f71c163b" />

           <img width="550" alt="image" src="https://github.com/user-attachments/assets/70a62c11-3e14-46f0-b2a6-6b15e64355f8" />

     - **Set Variable Activity**: Log the status of the copy operation.
       - **Name**: `LogStatus`
       - **Annotation**: `Log the status of the copy operation`

           <img width="550" alt="image" src="https://github.com/user-attachments/assets/f3aa5347-c31d-4e4b-bf60-f06f60b5f5b1" />

           <img width="550" alt="image" src="https://github.com/user-attachments/assets/e061e557-9ae2-49b2-8406-3a809e61a3fe" />

     - **Validate, Save and Run**:

         <img width="550" alt="image" src="https://github.com/user-attachments/assets/63b0db12-8a4e-4dae-ac5a-cdf74ab6f7bf" />

### Parameterization
>
> Use parameters to make your pipelines more flexible and easier to manage.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Use Parameters**            | Define parameters to make your pipelines more flexible and easier to manage.    | - Use parameters for source and destination paths, file names, and other configurable settings. <br/> - Define a parameter for the date range to dynamically filter data in a query. <br/> - Create a parameter for the environment (e.g., `Dev`, `Test`, `Prod`) to switch between different configurations. |
| **Dynamic Content**           | Utilize dynamic content expressions to reference parameters within activities.  | - `@pipeline().parameters.SourcePath` to dynamically set the source path in a Copy Data activity. <br/> - Use `@concat('https://', pipeline().parameters.StorageAccountName, '.blob.core.windows.net/')` to dynamically construct a URL. <br/> - Apply `@formatDateTime(pipeline().parameters.ExecutionDate, 'yyyy-MM-dd')` to format dates dynamically. |
| **Global Parameters**         | Use global parameters for values that are used across multiple pipelines.       | - Define a global parameter for a storage account name used in various pipelines. <br/> - Create a global parameter for a common API key used across multiple pipelines. <br/> - Use a global parameter for a base URL that is referenced in multiple activities. |
| **Parameterize Datasets**     | Parameterize datasets to handle different data sources or destinations.         | - Create a dataset with a parameterized file path to handle different file names dynamically. <br/> - Use parameters in datasets to switch between different databases or tables. <br/> - Define parameters for connection strings to dynamically connect to different data sources. |

### Incremental Loading
>
> Implement incremental data loading to improve efficiency.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Use Timestamps**            | Implement incremental loading using timestamps to load only new or changed data.| - Use a watermark table to track the last loaded timestamp and load data newer than this value. <br/> - Add a column to your source table to store the last modified timestamp and use it in your queries. |
| **Change Data Capture (CDC)** | Utilize CDC to capture and load only the changes made to the source data.       | - Enable CDC on a SQL Server table to capture insert, update, and delete operations. <br/> - Use the CDC functions to retrieve changes and apply them to your destination. |
| **Delta Loads**               | Perform delta loads to update only the changed data instead of full loads.      | - Use a query to fetch only the rows that have changed since the last load. <br/> - Implement a mechanism to track changes, such as a version number or a change flag. |
| **Partitioning**              | Partition large datasets to improve performance and manageability.              | - Partition data by date or another logical key to facilitate incremental loading. <br/> - Use partitioned tables in your data warehouse to improve query performance and manageability. |

#### Use Timestamps

> Implement incremental loading using timestamps to load only new or changed data.

1. **Add a Last Modified Column**:
   - Ensure your source table has a column to store the last modified timestamp.
   - Example: `LastModified` column in your source table.
2. **Create a Watermark Table**:
   - Create a table to track the last loaded timestamp.
   - Example: `WatermarkTable` with columns `TableName` and `LastLoadedTimestamp`.
3. **Set Up the Pipeline**:
   - Use a Lookup activity to get the last loaded timestamp from the watermark table.
   - Use a Copy Data activity to load data newer than the last loaded timestamp.
   - Example query: `SELECT * FROM SourceTable WHERE LastModified > @pipeline().parameters.LastLoadedTimestamp`.
4. **Update the Watermark Table**:
   - After loading the data, update the watermark table with the latest timestamp.
   - Use a Stored Procedure activity to update the `LastLoadedTimestamp` in the watermark table.

#### Change Data Capture (CDC)
>
> Utilize CDC to capture and load only the changes made to the source data.

1. **Enable CDC on Source Table**:
   - Enable CDC on your SQL Server table.
   - Example: `EXEC sys.sp_cdc_enable_table @source_schema = 'dbo', @source_name = 'SourceTable', @role_name = NULL`.
2. **Set Up the Pipeline**:
   - Use a Lookup activity to get the changes from the CDC table.
   - Example query: `SELECT * FROM cdc.dbo_SourceTable_CT WHERE __$operation IN (1, 2, 3)`.
3. **Process Changes**:
   - Use a ForEach activity to process each change.
   - Inside the ForEach activity, use Copy Data activities to apply the changes to the destination.

#### Delta Loads
>
> Perform delta loads to update only the changed data instead of full loads.

1. **Track Changes**:
   - Implement a mechanism to track changes, such as a version number or a change flag.
   - Example: Add a `ChangeFlag` column to your source table.
2. **Set Up the Pipeline**:
   - Use a Lookup activity to get the rows with changes.
   - Example query: `SELECT * FROM SourceTable WHERE ChangeFlag = 1`.
3. **Load Changed Data**:
   - Use a Copy Data activity to load only the changed data.
   - After loading, reset the `ChangeFlag` to 0.

#### Partitioning
>
> Partition large datasets to improve performance and manageability.

1. **Partition Your Data**:
   - Partition your source table by a logical key, such as date.
   - Example: Partition by `OrderDate`.
2. **Set Up the Pipeline**:
   - Use a Lookup activity to get the list of partitions to process.
   - Example query: `SELECT DISTINCT OrderDate FROM SourceTable WHERE OrderDate > @pipeline().parameters.LastProcessedDate`.
3. **Process Each Partition**:
   - Use a ForEach activity to process each partition.
   - Inside the ForEach activity, use a Copy Data activity to load data for each partition.

### Error Handling and Monitoring
>
> Set up robust error handling and monitoring to quickly identify and resolve issues.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Try-Catch Activities**      | - Use Try-Catch blocks to handle errors gracefully within pipelines (ADF). <br/>- If block (ADF in Fabric)         | - Use an If Condition activity to check for errors and handle them in a Catch block. <br/> - Implement a Try activity to execute the main logic and a Catch activity to handle any errors that occur. (ADF) <br/> - Add a Set Variable activity in the If block to log the error message. |
| **Retry Policies**            | Configure retry policies on activities to handle transient errors.              | - Set a retry policy with 3 retries and a 5-minute interval for a Copy Data activity. <br/> - Configure a Lookup activity to retry twice with a 2-minute interval in case of failure. <br/> - Use the retry policy on a Web Activity to handle intermittent network issues. |
| **Alerts and Notifications**  | Set up alerts and notifications to monitor pipeline runs and failures.          | - Use Azure Monitor to create alerts for failed pipeline runs and send email notifications. <br/> - Configure alerts to trigger SMS notifications for critical pipeline failures. <br/> - Set up a Logic App to send Slack notifications when a pipeline fails. |
| **Custom Logging**            | Implement custom logging to capture detailed error information.                 | - Use a Web Activity to log errors to an external logging service or database. <br/> - Implement an Azure Function to log detailed error information and call it from the pipeline. <br/> - Use a Set Variable activity to capture error details and write them to a log file in Azure Blob Storage. |

#### a. **Use If Condition Activity**

1. **Create a Pipeline**:
   - Open Microsoft Fabric and navigate to Azure Data Factory.

     <img width="200" alt="image" src="https://github.com/user-attachments/assets/cc4883f2-577a-4221-9e55-367f66eecfed" />

   - Create a new pipeline, click on `+ New item`, search for `pipeline`:

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/3178eb1f-6b28-47ae-b943-c952216a770a" />

2. **Add If Condition Activity**:
   - In the Activities pane, search for `If Condition`.
   - Add your copy data activity or any other necessary activity. You may include an if condition for process success or failure if required. The standard approach is to check for failure, but sometimes both conditions are used for logging purposes. Click the `If conditions` icon, and connect each block to its respective status.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/b1d7e0da-fa83-4f87-afac-4a4dde8ac72a" />

   - Configure the If Condition activity to check for specific conditions that indicate an error. For example, you can check the output of a previous activity.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/8d7b24b2-2322-4f54-8fc9-65f5faf467c5" />

3. **Define True and False Paths**:
   - Inside the If Condition activity, define the activities to execute if the condition is true (error handling logic) and if the condition is false (normal processing logic).
   - For the true path, add actions such as logging the error, sending notifications, or executing alternative logic.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/4d4f447e-0924-4f8c-8cb0-3dddc72ef85b" />

#### b. **Configure Activity Fault Tolerance**

1. **Set Retry Policy**:
   - Select an activity within your pipeline.
   - In the activity settings, configure the retry policy by specifying the number of retries and the interval between retries.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/3bd433c5-b953-44ed-a06e-25d25d6aee8f" />

2. **Enable Logging**: In the activity settings, enable the `Enable logging` option to ensure the pipeline proceeds even if the activity fails.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/35184bf2-de54-40d8-8968-d160760bc0bd" />

#### c. **Custom Error Handling**: Use Web Activity for error handling

- Add a Web Activity to your pipeline.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/2ee4242f-2d9f-4bb6-9703-a874d2964ab0" />

- Configure the Web Activity to call an external service or function to handle errors, such as sending an email notification or logging the error in a monitoring system.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/a16b6487-45c5-40b5-8cd8-82146eb5456d" />

#### d. **Pipeline Monitoring**: Monitor activity runs

- In the ADF monitoring interface, navigate to the `Monitor` section, if you don't see it click on `...`.
- Check the status of individual activities within your pipelines for success, failure, and skipped activities. Or search for any specific pipeline.
- Click on the activity to see the `Details`, and click on the `Pipeline Run ID`:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/72aa9b30-ec4c-4c6d-9f19-86f5c476cb65" />

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/bd52e6c5-c530-4df9-bbaf-8640ebbde336" />

### Security Measures
>
> Apply security best practices to protect your data.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Access Control**            | Implement role-based access control (RBAC) to manage permissions.               | - Assign specific roles to users and groups to control access to ADF resources. <br/> - Use Azure Entra ID `formerly known as Active Directory (AAD)`, to manage user permissions and access levels. <br/> - Create custom roles for specific tasks, such as `DataFactoryContributor` for pipeline authors. |
| **Data Encryption**           | Ensure data is encrypted at rest and in transit.                                | - Use Azure Storage encryption and HTTPS for data transfers. <br/> - Enable Transparent Data Encryption (TDE) for SQL databases used in ADF. <br/> - Use Azure Key Vault to manage encryption keys for data at rest. |
| **Network Security**          | Use virtual networks and private endpoints to secure data access.               | - Configure ADF to use a private endpoint for accessing data in a storage account. <br/> - Set up a virtual network (VNet) to isolate and secure ADF resources. <br/> - Use Network Security Groups (NSGs) to control inbound and outbound traffic to ADF. |
| **Audit Logs**                | Enable auditing to track access and changes to ADF resources.                   | - Use Azure Monitor to collect and analyze audit logs for ADF activities. <br/> - Enable diagnostic settings to send logs to Azure Log Analytics, Event Hubs, or a storage account. <br/> - Regularly review audit logs to detect and respond to unauthorized access or changes. |

### Use Azure Key Vault
>
> Store sensitive information such as connection strings, passwords, and API keys in Azure Key Vault to enhance security and manage secrets efficiently.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Store Secrets**             | Store sensitive information such as connection strings and passwords in Key Vault.| - Store a database connection string in Azure Key Vault and reference it in ADF. <br/> - Save API keys and other credentials in Key Vault to avoid hardcoding them in pipelines. <br/> - Use Key Vault to store SAS tokens for accessing Azure Storage. |
| **Access Policies**           | Configure access policies to control who can access secrets.                    | - Grant ADF managed identity access to specific secrets in Key Vault. <br/> - Set up access policies to allow only specific users or applications to retrieve secrets. <br/> - Use Key Vault access policies to restrict access based on roles and responsibilities. |
| **Secure Access**             | Use managed identities to securely access Key Vault secrets.                    | - Configure ADF to use its managed identity to retrieve secrets from Key Vault. <br/> - Enable managed identity for ADF and grant it access to Key Vault secrets. <br/> - Use managed identities to avoid storing credentials in code or configuration files. |
| **Rotate Secrets**            | Regularly rotate secrets to enhance security.                                   | - Update secrets in Key Vault periodically and update references in ADF. <br/> - Implement a process to rotate secrets automatically using Azure Automation or Logic Apps. <br/> - Notify relevant teams when secrets are rotated to ensure they update their configurations. |

#### Store Secrets

> Store sensitive information such as connection strings, passwords, and API keys in Key Vault.

1. **Create an Azure Key Vault**:
   - Go to the Azure portal and create a new Key Vault.
   - Set the appropriate access policies.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/0fb35e8b-e0a7-4314-98fb-cad652660d15" />

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/8950c6f2-9692-46a7-9556-f70627d2ed10" />

2. **Add Secrets to Key Vault**:
   - In the Key Vault, add secrets such as database connection strings, API keys, and SAS tokens.
   - Example: Add a secret named `DBConnectionString` with your database connection string.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/9046a4cb-8337-4263-ab07-750a759f034d" />

3. **Reference Secrets in Data Factory in Microsoft Fabric**:
   - In Data Factory within Microsoft Fabric, create a linked service and configure it to use the secret from Key Vault.
   - Example: Use `@Microsoft.KeyVault(SecretUri=https://<YourKeyVaultName>.vault.azure.net/secrets/DBConnectionString/)` in the linked service configuration.
  
       <img width="550" alt="image" src="https://github.com/user-attachments/assets/92787052-7512-4e1a-b5d9-50d05ec8219c" />

#### Access Policies
>
> Configure access policies to control who can access secrets.

1. **Set Up Access Policies in Key Vault**:
   - In the Key Vault, navigate to the Access policies section.
   - Add an access policy to grant the Data Factory managed identity access to specific secrets.
   - Example: Grant `Get` and `List` permissions to the Data Factory managed identity.

2. **Restrict Access Based on Roles**:
   - Define access policies to allow only specific users or applications to retrieve secrets.
   - Example: Grant access to specific roles such as `DataFactoryContributor` for managing secrets.

#### Secure Access

> Use managed identities to securely access Key Vault secrets.

**Grant Key Vault Access to Managed Identity**:

- In the Key Vault, add an access policy to grant the Data Factory managed identity access to the required secrets.
- Example: Grant `Get` and `List` permissions to the managed identity.

#### Rotate Secrets
>
> Regularly rotate secrets to enhance security.

1. **Update Secrets in Key Vault**:
   - Periodically update secrets in Key Vault to ensure they remain secure.
   - Example: Update the `DBConnectionString` secret with a new connection string.
2. **Implement Automated Secret Rotation**:
   - Use Azure Automation or Logic Apps to automate the process of rotating secrets.
   - Example: Create an Azure Automation runbook to update secrets and notify relevant teams.
3. **Notify Teams of Secret Rotation**:
   - Ensure that relevant teams are notified when secrets are rotated.
   - Example: Use Logic Apps to send email notifications when secrets are updated.

### Source Control

> Benefits of Git Integration: <br/>
>
> - **Version Control**: Track and audit changes, and revert to previous versions if needed.  <br/>
> - **Collaboration**: Multiple team members can work on the same project simultaneously.  <br/>
> - **Incremental Saves**: Save partial changes without publishing them live.  <br/>
> - **Change Tracking**: Easily identify who made changes and when.

1. **Create a Git Repository**:
   - You can use either Azure Repos or GitHub for your Git repository.
   - Create a new repository if you don't already have one.
2. **Configure Git Integration in Data Factory**:
   - Open your Data Factory in Microsoft Fabric.
   - Go to the `Workspace settings` tab.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/a0502d5a-0006-433c-b1ab-ec7f928ab2bd" />

   - Under `Git integration`, click on `Connect Git provider and account`.
   - Select the repository type (Azure DevOps Git or GitHub).

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/8ba7b1d2-0570-4753-937f-9abfc90e1d5f" />

   - Provide the necessary details such as the repository name, collaboration branch, and publish branch.
   - Optionally, import existing resources into the repository.
3. **Branch Management**:
   - **Feature Branch**: Create feature branches for development. These branches allow you to work on new features or changes without affecting the main codebase.
   - **Collaboration Branch**: This branch is used for testing and reviewing changes before they are merged into the main branch.
   - **Publish Branch**: The publish branch (e.g., `adf_publish`) contains the ARM templates of the live code.
4. **Develop and Save Changes**:
   - Work on your pipelines in the feature branch.
   - Save changes incrementally in the Git repository.
   - Use the **Publish** button to push changes from the collaboration branch to the publish branch, making them live.
5. **Collaboration and Review**:
   - Use pull requests to review and merge changes from feature branches to the collaboration branch.
   - Collaborate with team members through code reviews and comments.

### Resource Management
>
> Optimize resource usage to improve performance and reduce costs.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Optimize Resource Usage**   | Monitor and optimize resource usage to improve performance and reduce costs.    | - Use Azure Monitor to track resource usage and identify optimization opportunities. <br/> - Analyze pipeline execution times to find and eliminate bottlenecks. <br/> - Use cost analysis tools to identify and reduce unnecessary expenses. |
| **Scaling**                   | Scale ADF resources based on workload requirements.                             | - Use Azure Data Factory's scaling features to adjust resources during peak loads. <br/> - Implement auto-scaling for data flows to handle varying data volumes. <br/> - Adjust the number of Data Integration Units (DIUs) based on workload requirements. |
| **Cost Management**           | Implement cost management practices to control expenses.                        | - Use Azure Cost Management to monitor and manage ADF costs. <br/> - Set budgets and alerts to avoid unexpected expenses. <br/> - Review and optimize the use of Data Integration Units (DIUs) to balance cost and performance. |
| **Resource Tagging**          | Tag resources for better organization and cost tracking.                        | - Apply tags to ADF resources to categorize and track costs by project or department. <br/> - Use tags to identify and manage resources associated with specific business units. <br/> - Implement tagging policies to ensure consistent resource tagging across the organization. |

### Testing and Validation
>
> Regularly test and validate your pipelines to ensure they work as expected.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Unit Testing**              | Implement unit tests for individual pipeline components.                        | - Use Azure DevOps to create unit tests for ADF activities and datasets. <br/> - Test individual activities like Copy Data or Lookup to ensure they function correctly. <br/> - Validate parameter values and outputs for each activity. |
| **Integration Testing**       | Perform integration testing to ensure end-to-end functionality.                 | - Test the entire data pipeline from source to destination to validate data flow. <br/> - Simulate real-world scenarios to ensure the pipeline handles data correctly. <br/> - Verify data transformations and loading processes in an integrated environment. |
| **Validation Activities**     | Use validation activities to check data quality and integrity.                  | - Add a validation activity to verify the row count or data format after a Copy Data activity. <br/> - Implement data quality checks to ensure data accuracy and completeness. <br/> - Use custom scripts or functions to validate complex data transformations. |
| **Automated Testing**         | Automate testing processes to ensure consistency and reliability.               | - Use Azure DevOps pipelines to automate the testing of ADF pipelines. <br/> - Schedule automated tests to run after each deployment or code change. <br/> - Integrate automated testing with CI/CD pipelines to ensure continuous validation. |

### Documentation
>
> Maintain comprehensive documentation for your pipelines.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Comprehensive Documentation**| Maintain detailed documentation for all pipelines and activities.               | - Document the purpose, inputs, outputs, and dependencies of each pipeline. <br/> - Include step-by-step instructions for setting up and running pipelines. <br/> - Provide examples and use cases to illustrate pipeline functionality. |
| **Version Control**           | Use version control to manage documentation updates.                            | - Store documentation in a Git repository alongside the pipeline code. <br/> - Track changes to documentation to maintain an accurate history. <br/> - Use pull requests to review and approve documentation updates. |
| **Annotations**               | Use annotations within ADF to provide context and explanations.                 | - Add annotations to activities to describe their function and any important details. <br/> - Use comments to explain complex logic or business rules within the pipeline. <br/> - Highlight key parameters and settings with annotations for easy reference. |
| **Knowledge Sharing**         | Share documentation with the team to ensure everyone is informed.               | - Use a shared platform like SharePoint or Confluence to store and share documentation. <br/> - Conduct regular training sessions to keep the team updated on best practices. <br/> - Encourage team members to contribute to and update the documentation. |

### Regular Updates
>
> Keep your pipelines and ADF environment up to date.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Keep ADF Up to Date**       | Regularly update ADF to the latest version to benefit from new features and fixes.| - Monitor Azure updates and apply them to your ADF environment. <br/> - Subscribe to Azure updates and announcements to stay informed. <br/> - Test updates in a staging environment before applying them to production. |
| **Pipeline Maintenance**      | Regularly review and update pipelines to ensure they remain efficient and effective.| - Schedule periodic reviews of pipeline performance and make necessary adjustments. <br/> - Optimize pipeline logic and activities to improve efficiency. <br/> - Remove or update deprecated activities and datasets. |
| **Dependency Management**     | Keep dependencies up to date to avoid compatibility issues.                     | - Update linked services and datasets to use the latest versions of data sources. <br/> - Regularly review and update external dependencies like libraries and APIs. <br/> - Ensure compatibility between ADF and other integrated services. |
| **Security Patches**          | Apply security patches promptly to protect against vulnerabilities.             | - Monitor security advisories and apply patches to ADF and related services. <br/> - Implement a patch management process to ensure timely updates. <br/> - Conduct regular security assessments to identify and address vulnerabilities. |

### Performance Tuning
>
> Continuously monitor and tune performance.

| **Best Practice**             | **Description**                                                                 | **Example**                                                                                     |
|-------------------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Monitor Performance**       | Continuously monitor pipeline performance to identify bottlenecks.              | - Use Azure Monitor to track pipeline execution times and resource usage. <br/> - Set up alerts for performance thresholds to detect issues early. <br/> - Analyze performance metrics to identify and resolve bottlenecks. |
| **Optimize Queries**          | Optimize queries used in activities to improve performance.                     | - Rewrite SQL queries to reduce execution time and resource consumption. <br/> - Use indexing and partitioning to improve query performance. <br/> - Avoid complex joins and subqueries that can slow down data processing. |
| **Parallel Processing**       | Use parallel processing to speed up data processing tasks.                      | - Configure ForEach activities to run in parallel for faster execution. <br/> - Use parallelism in data flows to process large datasets more efficiently. <br/> - Balance parallel tasks to avoid overloading resources. |
| **Resource Allocation**       | Allocate resources efficiently to balance performance and cost.                 | - Adjust the number of Data Integration Units (DIUs) based on workload requirements. <br/> - Use resource groups to manage and allocate resources effectively. <br/> - Monitor resource usage and adjust allocations to optimize performance. |

## Recommended Training Modules on Microsoft Learn

- [Introductory training modules for Azure Data Factory](https://learn.microsoft.com/en-us/azure/data-factory/quickstart-learn-modules)
  - [Quickstart: Get started with Azure Data Factory](https://learn.microsoft.com/en-us/azure/data-factory/quickstart-get-started)
  - [Introduction to Azure Data Factory](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-data-factory/): This module covers the basics of ADF and how it can help integrate your data sources
  - [Integrate data with Azure Data Factory or Azure Synapse Pipeline](https://learn.microsoft.com/en-us/training/modules/data-integration-azure-data-factory/): Learn about data integration patterns, setting up ADF, and creating pipelines
  - [Petabyte scale ingestion with Azure Data Factory or Azure Synapse Pipeline](https://learn.microsoft.com/en-us/training/modules/petabyte-scale-ingestion-azure-data-factory/): Explore the different methods for transferring data between various data stores using Azure Data Factory.
- [A categorized list of Azure Data Factory tutorials by scenarios](https://learn.microsoft.com/en-us/azure/data-factory/data-factory-tutorials)
- [Full list of Data Factory trainings](https://learn.microsoft.com/en-us/training/browse/?expanded=azure&products=azure-data-factory)

 <div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
