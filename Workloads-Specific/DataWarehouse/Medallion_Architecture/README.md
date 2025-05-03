# Demostration: Medallion Architecture Overview

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-03

------------------------------------------

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Fabric Draw.io icons](https://github.com/marclelijveld/Fabric-Icons/tree/main)
- [TechExcel: Microsoft Fabric with Azure Databricks for Data Analytics (lvl 300 / CSU) lab](https://github.com/microsoft/TechExcel-Fabric-with-Databricks-for-Data-Analytics/blob/main/index.md) - repo
- [TechExcel: Microsoft Fabric with Azure Databricks for Data Analytics (lvl 300 / CSU) lab](https://microsoft.github.io/TechExcel-Fabric-with-Databricks-for-Data-Analytics/) - guide 

</details>

<details>
<summary><b>Table of Contents</b> (Click to expand)</summary>

- [Overview](#overview)
- [Demo](#demo)
  - [Step 1: Set Up Your Environment](#step-1-set-up-your-environment)
  - [Step 2: Ingest Data into the Bronze Layer](#step-2-ingest-data-into-the-bronze-layer)
  - [Step 3: Transform Data in the Silver Layer](#step-3-transform-data-in-the-silver-layer)
  - [Step 4: Curate Data in the Gold Layer](#step-4-curate-data-in-the-gold-layer)
  - [Step 5: Set Up Pipelines for Orchestration](#step-5-set-up-pipelines-for-orchestration)
  - [Step 6: Enable Data Access for Reporting](#step-6-enable-data-access-for-reporting)

</details>

## Overview 

> The medallion architecture is a data design pattern used in data lakes and lakehouses to organize data at different levels of refinement. It's a best practice for managing the data lifecycle and ensuring data quality

| Layer       | Description |
|-------------|-------------|
| **Bronze Layer** | This layer contains the raw data ingested from various sources. The data is typically stored in its original format and is append-only. The Bronze layer acts as the landing zone for all incoming data. |
| **Silver Layer** | This layer contains cleaned and transformed data. The data in the Silver layer is often enriched with additional information and is structured in a way that makes it easier to query and analyze. This layer is also where data quality checks and transformations are applied. |
| **Gold Layer** | This layer contains curated and aggregated data that is ready for consumption by business intelligence and reporting tools. The data in the Gold layer is highly structured and optimized for performance. |

> [!NOTE]
> This demo will be created step by step. Please note that Microsoft Fabric already assists by setting up the medallion flow for you.

> [!IMPORTANT]
> If you are not able to see the `auto-create report` option neither `copilot` be aware you need to enable AI features in your tenant, click [here](https://github.com/brown9804/MicrosoftCloudEssentialsHub/blob/main/0_Azure/2_AzureAnalytics/0_Fabric/demos/6_PBiCopilot.md#tenant-configuration) to see how.

<img width="550" alt="image" src="https://github.com/user-attachments/assets/7eec0098-7b7b-453c-9dbb-ee1a6390577b">

<img width="550" alt="image" src="https://github.com/user-attachments/assets/4bbb5f10-415b-44b2-8fd0-a5a12482ce2c">

## Demo 

Implementing a medallion architecture provides several benefits:

- **Data Quality**: By organizing data into layers, you can apply quality checks and transformations in a structured manner, ensuring that the data in the Gold layer is reliable and ready for analysis.
- **Scalability**: The architecture allows you to scale your data processing pipelines independently for each layer, providing flexibility and efficiency.
- **Performance**: The Gold layer is optimized for performance, which means that your reporting and analytics queries will run faster.
- **Simplicity**: It simplifies the data pipeline by breaking it down into smaller, manageable steps, each with a clear purpose.
- **Auditability**: It provides a clear data lineage, making it easier to trace the origin of data and understand the transformations applied at each stage.

    <img width="750" alt="image" src="https://github.com/user-attachments/assets/0630fb8c-29a5-499c-bfa9-f252af7debbc">

### Step 1: Set Up Your Environment

> [!NOTE]
> If you need more visual help, check out the video that walks you through the steps. Below is a detailed step-by-step guide.

1. **Create a Fabric Workspace**: This will be your central hub for all activities.
   - Click on `Create a resource` and create your Fabric Capacity if you haven't done so already.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/8f259cac-1dcb-4129-9070-0b31899c4ab4">

   - Go to the [Fabric portal](https://app.fabric.microsoft.com/).
   - Click on `Workspaces`, then select either your existing workspace or create a new one by clicking `New Workspace`:
   - Provide a name and other required details, then create the workspace.
     
      <img width="550" alt="image" src="https://github.com/user-attachments/assets/2f3225fc-6aa6-4eeb-8207-75038b36f18f">

   - Now, assign the Fabric Capacity to your workspace by clicking on `Workspace settings` and selecting the fabric capacity under the license.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/1831c97d-6b9a-4470-968d-e7803bc58b80">

        <https://github.com/user-attachments/assets/c524741c-be91-4fe4-82bc-c841fae8c6c9>

2. **Create Lakehouses**: Set up three lakehouses for the Bronze, Silver, and Gold layers.

   - In your Fabric workspace, create three lakehouses named `raw_Bronze`, `cleansed_Silver`, and `curated_Gold`.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/5827c73a-1291-4fb6-a2c6-0c61f4808164">

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/ca3c64c7-d414-4ec0-8cbc-cf39548bf758">

      <img width="958" alt="image" src="https://github.com/user-attachments/assets/828adf9d-8722-4bef-8694-8c22de330797">

        <https://github.com/user-attachments/assets/fdb64dd2-a6ec-4da0-a385-e55f875c8f8e>

### Step 2: Ingest Data into the Bronze Layer

1. **Identify Data Sources**:
   - Determine the sources from which you'll ingest data.
   - List all the data sources such as databases, APIs, file systems, etc.

     > Let's suppose you have your data locally as csv, you can upload your data to the raw layer. Click [to access sample files in case you don't have any data at the moment](./sample_files)
        
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/0ebd4ca9-80f6-4d1c-a28c-fc7ab6988538">

     > You need to load the data as tables, either to a new table or to a existing one:
     
        |  Load information as table   |   To a new one or existing one | 
        | --- | --- | 
        |  <img width="550" alt="image" src="https://github.com/user-attachments/assets/09994e75-3029-4f61-aac8-b50f7c5fd2b1"> |  <img width="550" alt="image" src="https://github.com/user-attachments/assets/2b25d187-85e2-48e7-9a97-e7549f28ed9c"> | 

        <https://github.com/user-attachments/assets/56308a58-cf72-4f0f-bf3e-e9e1669fa0df>

> Suppose you need to extract data from your `sql database`

<img width="550" alt="image" src="https://github.com/user-attachments/assets/1b186362-8041-4bd7-b797-ea2061d80b63">

> [!NOTE]
> In case you don't have any data at the moment, please follow this video to create a sample:

```sql
CREATE TABLE dbo.Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10, 4)
);

INSERT INTO dbo.Employees (EmployeeID, FirstName, LastName, BirthDate, HireDate, JobTitle, Salary)
VALUES 
(1, 'John', 'Doe', '1985-11-15', '2010-03-10', 'Software Engineer', 75000.0000),
(2, 'Jane', 'Smith', '1990-05-22', '2012-07-18', 'Project Manager', 85000.0000),
(3, 'Emily', 'Jones', '1988-04-17', '2014-06-25', 'Data Analyst', 65000.0000),
(4, 'Michael', 'Brown', '1982-06-21', '2008-09-15', 'HR Specialist', 55000.0000),
(5, 'Sarah', 'Davis', '1995-09-30', '2020-11-20', 'Marketing Specialist', 60000.0000);
```

<https://github.com/user-attachments/assets/357184bf-cc49-4311-84d4-6369514b3366>

> [!IMPORTANT]
> Besides using Data pipelines to bring your SQL information, you can also leverage Microsoft Fabric's mirrored SQL capability. This feature allows you to create a mirrored copy of your SQL database, improving data availability, reliability, and disaster recovery. By maintaining a synchronized copy of your database in a different location, it ensures that your data is always accessible, even in the event of a failure or outage.

> [!NOTE]
> `The mirroring process can involve both inbound and outbound connections`. Inbound connections refer to data coming into Azure from external sources, such as an on-premises SQL database being mirrored in Azure. Outbound connections, on the other hand, refer to data going out from Azure to external destinations, like mirroring an Azure SQL database to Microsoft Fabric. This setup allows for seamless data flow and integration across different platforms, ensuring data consistency and availability. <br/> <br/>
> `For example, both Azure SQL Database and Microsoft Fabric are Microsoft products. However, the concept of outbound connections still applies because the data is moving from one service (Azure SQL Database) to another service (Microsoft Fabric), even though they are both within the Microsoft ecosystem. This movement of data is considered outbound because it is leaving the Azure SQL Database environment and entering the Microsoft Fabric environment`. <br/> <br/>
> Under the Zero Trust Architecture, both inbound and outbound connections are treated with the same level of scrutiny and security protocols. This means that whether the connection is inbound or outbound, it is subject to strict verification processes to ensure it is safe and authorized. Key principles of Zero Trust include verification of every access request, least privilege access, continuous monitoring, and micro-segmentation. By applying these principles, Azure ensures that both inbound and outbound connections are secure, reducing the risk of unauthorized access and data breaches.

<https://github.com/user-attachments/assets/2a64762a-f120-4448-b0fb-7a49f4d1bedb>

2. **Create Dataflows or Pipelines**: Use Data Factory to create dataflows or pipelines that ingest data into the Bronze lakehouse.
   - In Data Factory, create a new pipeline.
   - Add activities to the pipeline to ingest data from the identified sources.
   - **Configure Data Ingestion**: Set up the data ingestion process to load data into the Bronze layer in its raw format.
       - Configure the source and destination settings in the pipeline activities.
       - Ensure the data is being ingested into the `raw_Bronze` lakehouse.

            <img width="550" alt="image" src="https://github.com/user-attachments/assets/5b3169ec-7efe-4bfa-b38f-2820e9e7865e">

            <img width="550" alt="image" src="https://github.com/user-attachments/assets/b6d9623a-aaab-4351-ae79-d052267e5c0b">

            <img width="550" alt="image" src="https://github.com/user-attachments/assets/0212202f-a0ff-4aa6-99df-06eeaf680191">

            <img width="550" alt="image" src="https://github.com/user-attachments/assets/507ef21f-a8e1-4a8d-b433-cf5ff5ccd236">

            <img width="550" alt="image" src="https://github.com/user-attachments/assets/205f7928-e958-43f8-a0c3-131f2e8683ea">

            <img width="550" alt="image" src="https://github.com/user-attachments/assets/0c0bd512-f6f0-4a36-8d65-84aa93360873">

            <img width="550" alt="image" src="https://github.com/user-attachments/assets/dfc7c0bb-dc2d-4ca7-82a8-e6244a392f52">

            <img width="550" alt="image" src="https://github.com/user-attachments/assets/5e0ae097-e747-47a5-b0c3-e7408e90292a">

### Step 3: Transform Data in the Silver Layer

1. **Create Notebooks or Dataflows**: Use Fabric's notebooks or dataflows to read data from the Bronze layer.
   - In the Fabric workspace, create a new notebook.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/0105a408-d680-4f3a-941a-6c867f37cb18">

   - Connect the notebook to the `raw_Bronze` lakehouse.
2. **Data Cleaning**: Apply data cleaning steps to handle missing values, remove duplicates, and correct data types.
   - Write code in the notebook to clean the data.
   - Use functions like `dropna()`, `dropDuplicates()`, and `withColumn()` to clean the data.
3. **Data Enrichment**: Enrich the data with additional information if needed.
   - Join the data with reference tables or lookup values.
   - Add new columns with enriched information.
4. **Write to Silver Layer**: Write the cleaned and transformed data to the Silver lakehouse.
   - Use the `write.format("delta").save()` method to save the data to the `cleansed_Silver` lakehouse.

      > **PySpark Code to Move Data from Bronze to Silver**:

        ```python
        # Read data from the Bronze layer
        bronze_df = spark.read.format("delta").load("abfss://<your-container-name>@<your-storage-account-name>.dfs.core.windows.net/<your-bronze-lakehousename>.Lakehouse/Tables/<table name>")

        # Perform transformations (if any)
        silver_df = bronze_df  # Assuming no transformations for simplicity
        
        # Write data to the Silver layer
        silver_df.write.mode("overwrite").option("mergeSchema", "true").format("delta").save("abfss://<your-container-name>@<your-storage-account-name>.dfs.core.windows.net/<your-silver-lakehousename>.Lakehouse/Tables/<table_name>")
        ```
  
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/16181f57-67b6-4141-8259-cf2ca0fc072e">
        
        > If you want see more, click [here](./src/0_notebook_bronze_to_silver.ipynb) to see a sample of the notebook.
        
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/5affce77-ec21-4b03-881e-877ff2425b9d">

### Step 4: Curate Data in the Gold Layer

1. **Read Data from Silver Layer**: Use notebooks or dataflows to read data from the Silver lakehouse.
   - In a new notebook, connect to the `cleansed_Silver` lakehouse.
2. **Apply Business Logic**: Apply any additional business logic or aggregations.
   - Write code to perform aggregations and calculations.
   - Use functions like `groupBy()`, `agg()`, and `sum()` to aggregate the data.
3. **Write to Gold Layer**: Write the curated data to the Gold lakehouse.
   - Use the `write.format("delta").save()` method to save the data to the `curated_Gold` lakehouse.

        > Before any changes:

        <img width="170" alt="image" src="https://github.com/user-attachments/assets/759d1c7a-9d2d-404c-99e4-de068399ed4a">

        > Applying some transformations: If you want see more, click [here](./src/1_notebook_silver_to_gold.ipynb) to see a sample of the notebook.

        > **PySpark Code to Move Data from Silver to Gold**:

        ```python
        # Read data from the Silver layer
        silver_df = spark.read.format("delta").load("abfss://<your-container-name>@<your-storage-account-name>.dfs.core.windows.net/<your-silver-lakehouse>.Lakehouse/Tables/<table name>")
        
        # Perform aggregations
        gold_df = silver_df.groupBy("Name").agg(
            sum("Count").alias("TotalCount"),
            avg("price").alias("AveragePrice"),
            avg("tax").alias("AverageTax")
        )
        
        # Write data to the Gold layer
        gold_df.write.mode("overwrite").option("mergeSchema", "true").format("delta").save("abfss://<your-container-name>@<your-storage-account-name>.dfs.core.windows.net/<your-gold-lakehouse name>.Lakehouse/Tables/<your table name>")
        ```

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/d092d34f-86f5-4853-aea7-88ff4062f4af">

### Step 5: Set Up Pipelines for Orchestration

1. **Create Pipelines**: Create pipelines to automate the movement of data from the Bronze layer to the Silver layer, and from the Silver layer to the Gold layer.
   - In Data Factory, create a new pipeline.
   - Add a copy activity to move data from the `raw_Bronze` lakehouse to the `cleansed_Silver` lakehouse.
   - Add another copy activity to move data from the `cleansed_Silver` lakehouse to the `curated_Gold` lakehouse.
2. **Schedule Pipelines**: Schedule these pipelines to run at appropriate intervals.
   - Set up triggers in Data Factory to run the pipelines on a schedule that aligns with your data freshness requirements.
   - Consider the frequency of data updates and the latency that is acceptable for your use case.

### Step 6: Enable Data Access for Reporting

1. **Configure SQL Analytics Endpoint**:
   - Validate if you have the SQL Analytics Endpoint configured, you can review it from workspace view, primarly is required for Gold layer to be accessible to your reporting tools. 

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/77b4cbf9-6dba-4cc5-bc20-5755ae14bc8b">

2. Create a semantic models with the required tables for the report.

   - Go to your gold layer.
        
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/8b4b7de1-fff4-4d1e-acda-15ef00aa88a2">

   - Create the semantic model:
        
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/91464446-262a-4dd1-9234-69cf7d889876">

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/2cd16d3a-3ac8-4546-bb14-9d066cdabb62">

3. **Create Power BI Reports**: Use Power BI in Direct Lake Mode to create reports and dashboards from the data in the Gold layer.
   - Connect to the `curated_Gold` lakehouse using the SQL analytics endpoint.
   - Build reports and dashboards that provide insights into the data.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/c0861bc6-bcdb-426a-95c6-c396078e19b3">

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/c9c63d99-ae66-469d-8059-db687423adc8">

        > Create new report:

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/1ae58ad5-8c91-452b-ad79-2e14e38c69a1">

        > If you click `auto-create report` Copilot will create a draft report for you:
        
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/2c3403ca-0cde-4008-a8c1-ae3c92f196e8">

        > You can edit your report:
        
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/69ecd0e9-0a1a-42ac-b39c-23ec65257fa1">
        
        > Also, you can levarage AI capabilities with Copilot:
        
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/01cb521f-8529-4097-95bf-7c30a92fefd2">

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
