# Incremental Refresh for Reporting - Overview

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-02

----------

> [!NOTE]
> When you create a `semantic model in Microsoft Fabric`, it supports `incremental refresh` configurations defined in `Power BI Desktop as well as Fabric’s` own refresh orchestration tools. This allows you to set up policies such as retaining historical data while refreshing only recent periods, and once the model is published to Fabric, those settings are preserved and enforced. However, it is important to note that if you are working with a `Power BI semantic model`, the `incremental refresh must be configured in Power BI Desktop before publishing to Fabric`. Once published, you cannot define or modify the incremental refresh policy directly in the Fabric service. `This distinction ensures that refresh behavior is consistent and optimized, but it also means planning and configuration must be done in advance when using Power BI semantic models.`

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Incremental refresh overview](https://learn.microsoft.com/en-us/power-bi/connect-data/incremental-refresh-overview)
- [Configure incremental refresh and real-time data](https://learn.microsoft.com/en-us/power-bi/connect-data/incremental-refresh-configure)
- [xmSQL code in VertiPaq - SQLBI Docs](https://docs.sqlbi.com/dax-internals/vertipaq/xmSQL)
- [Optimize Power BI Semantic Model Performance with Vertipaq](https://www.sqlservercentral.com/articles/how-to-optimize-power-bi-semantic-model-performance-with-vertipaq-analyzer)
- [Refreshing Individual Tables and Partitions With Semantic Link](https://fabric.guru/refreshing-individual-tables-and-partitions-with-semantic-link)
- [Data reduction techniques for Import modeling - Power BI](https://learn.microsoft.com/en-us/power-bi/guidance/import-modeling-data-reduction)
- [Troubleshoot incremental refresh and real-time data - Power BI](https://learn.microsoft.com/en-us/power-bi/connect-data/incremental-refresh-troubleshoot)

</details>

<details>
<summary><b>Table of Contents</b> (Click to expand)</summary>

- [Overview](#overview)
- [How the VertiPaq Engine Works](#how-the-vertipaq-engine-works)
- [How to create a unique key](#how-to-create-a-unique-key)
  - [Best Practices for Creating Unique Keys in Power BI](#best-practices-for-creating-unique-keys-in-power-bi)
  - [Strategies to Avoid High Cardinality in Power BI](#strategies-to-avoid-high-cardinality-in-power-bi)
- [Steps to Change a Column Type to Date in Power BI](#steps-to-change-a-column-type-to-date-in-power-bi)

</details>

## Overview

> Allows Power BI to refresh only the data that has changed or is new since the last refresh, rather than refreshing the entire dataset. Particularly useful for large datasets, reducing processing and transfer times.

| **Aspect**                      | **Details**                                                                                                                                                                                                 |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Configuration**               | - Configured using Power Query date/time parameters with the reserved names `RangeStart` and `RangeEnd`. <br> - These parameters define the range of data to be refreshed, allowing Power BI to refresh only the relevant partitions. |
| **Benefits**                    | - **Efficiency**: Only the most recent data that has changed needs to be refreshed, reducing the overall load on the system. <br> - **Performance**: Refreshes are faster and more reliable, minimizing long-running connections to volatile data sources. <br> - **Scalability**: Large semantic models with potentially billions of rows can grow without the need to fully refresh the entire model with each refresh operation. |
| **Limitations/Considerations**  | - **Initial Setup Complexity**: Setting up incremental refresh requires careful configuration of date/time parameters and understanding of data partitioning. <br> - **Data Source Support**: Not all data sources support incremental refresh; ensure your data source is compatible. <br> - **Storage Costs**: Incremental refresh can lead to increased storage costs due to the retention of historical data partitions. <br> - **Data Model Changes**: Significant changes to the data model may require a full refresh, negating the benefits of incremental refresh. |

> Configuring Incremental Refresh in Power BI

1. **Open Power BI Desktop** and load your data.
2. **Go to the Power Query Editor** by clicking on `Transform Data`.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/0786f906-9e15-4751-94d1-1807afef7dda">

3. **Create Parameters**: In Power Query Editor, create `RangeStart` and `RangeEnd` parameters to define the date range for incremental refresh.
   - Select `Manage Parameters` > `New Parameter`.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/fe88a6c8-ea8c-46f9-9ea2-fda795ec5267">

   - Name the parameters `RangeStart` and `RangeEnd`, and set their data type to `Date/Time`.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/0e47b52a-d174-4f85-9fef-ce51b904dac4">

4. **Filter Data**: Apply filters to your data based on the `RangeStart` and `RangeEnd` parameters to ensure only the relevant data is loaded.
   - Select the date column you want to filter.
   - Apply a custom filter using the `RangeStart` and `RangeEnd` parameters.
   - Once you have done, click on `Close & Apply`

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/bf7e4d68-f644-413f-a26b-1290ff6a9585">

5. **Define Policy**: Set up an incremental refresh policy in Power BI Desktop. This policy will automate partition creation and management, ensuring that only the most recent data is refreshed.
   - In the `Model view` tab, select `...`, and choose `Incremental refresh`:

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/de66579e-2746-4b54-b411-a65a147e7b36">

   - Define the refresh policy, specifying how much historical data to keep and how frequently to refresh.

## How the VertiPaq Engine Works

> The Vertipaq engine in Power BI handles compression and storage of data in memory. It translates SQL requests to pull in data from various sources and maps it to the semantic model.

1. **Data Transformation and Loading**:
   - The VertiPaq engine transforms and loads data from various sources into the Power BI model. This process includes handling data type conversions, such as date-time transformations, which can sometimes be a source of issues if not managed correctly.
   - The engine compresses the data using advanced techniques like dictionary encoding, run-length encoding, and value encoding to optimize memory usage and improve query performance.
2. **Mapping to the Semantic Model**:
   - Once the data is loaded, the VertiPaq engine maps it to the semantic model. This involves creating relationships between tables and defining how data should be aggregated and displayed.
   - The semantic model helps Power BI understand the structure and relationships within the data, enabling efficient querying and reporting.
3. **Unique Key Identification**:
   - To manage updates and ensure data consistency, the VertiPaq engine uses unique keys. These keys are typically based on the primary keys defined in the source data.
   - Instead of concatenating multiple columns, the engine relies on these primary keys and metadata tags to uniquely identify each row. This approach helps in determining which records to replace and which to skip during data refreshes.
   - Key Identification in Power BI: The VertiPaq engine in Power BI uses unique keys to identify which records to replace and which to skip during incremental refresh. These keys can be created by concatenating multiple columns that together uniquely identify each record. Here are some steps to help you determine which columns to use and how to create the key:
      1. **Date/Time Column**: Ensure that the date/time column used for incremental refresh is correctly transformed and consistent. Any discrepancies in the decimal point position can cause errors. Verify that the transformation, like from UTC to UTC-4 is accurate.
      2. **Unique Key Creation**: To create a unique key, you can concatenate multiple columns that together uniquely identify each record. For example, you might use a combination of the date/time column, a caller ID, and a call ID to create a unique key for each record.
      3. **Metadata Tags**: Check if there are metadata tags that uniquely identify each row in the semantic model. These tags can be used by the VertiPaq engine to map records accurately.

> How VertiPaq Translates SQL Requests

| **Aspect**                     | **Details**                                                                                                                                                                                                 |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **SQL Request Translation**   | - VertiPaq uses a pseudo-SQL language called **xmSQL** to translate SQL requests. This language is similar to SQL but optimized for the internal workings of VertiPaq. <br/> - When a query is executed, VertiPaq translates it into xmSQL, which includes implicit `GROUP BY` clauses and optimized aggregation functions. |
| **Mapping to the Semantic Model** | - VertiPaq maps the data to the semantic model by creating a highly compressed, columnar storage format. This involves encoding and compressing the data to optimize memory usage and query performance. <br/> - The engine uses metadata to understand the structure and relationships within the data, ensuring that queries are executed efficiently. |

> Handling Records: Replacement and Skipping

| **Aspect**                     | **Details**                                                                                                                                                                                                 |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Metadata Variables**        | - VertiPaq uses metadata to tag each row and manage data updates. This metadata includes information about the columns and their relationships, which helps in identifying which records to replace or skip during data refreshes. <br/> - The metadata is crucial for maintaining the integrity and performance of the semantic model. |
| **Unique Keys**               | - Instead of concatenating all columns to create a unique key, VertiPaq relies on the existing relationships and keys defined in the data model. These keys are used to ensure data consistency and to manage updates efficiently. <br/> - The engine uses these keys to match incoming data with existing records, determining which records need to be updated or skipped. |

> Troubleshooting Tips

- **Use Tools**: Tools like **DAX Studio** and **VertiPaq Analyzer** can help you inspect the metadata and understand how VertiPaq is handling your data.
- **Optimize Data Model**: Ensure your data model is well-structured, preferably using a star schema, to improve performance and make troubleshooting easier.
- **Monitor Performance**: Keep an eye on performance metrics to identify any bottlenecks or issues related to data transformations and loading. Regular monitoring can help you catch and address issues before they impact your reports and dashboards.
  
## How to create a unique key

> By concatenating multiple columns using DAX (Data Analysis Expressions) in Power BI

- **Open Power BI Desktop**: In Power BI Desktop, go to the `Modeling` tab.
- **Create a New Column**: Click on `New Column` to create a new calculated column.
- **Enter the DAX Formula**: In the formula bar, enter a DAX expression to concatenate the columns you want to use as the unique key.

   ```DAX
   UniqueKey = [column1] & "_" & [column2] & "_" & [column3]
   ```

  For example:

   ```DAX
   UniqueKey = [DateTimeColumn] & "_" & [CallerID] & "_" & [CallID]
   ```

- **Apply the Changes**: After entering the formula, press Enter to create the new column. In this DAX formula example, it concatenates the `DateTimeColumn`, `CallerID`, and `CallID` columns with underscores to create a unique key for each record.

### Best Practices for Creating Unique Keys in Power BI

| Best Practice                        | Description                                                                                           |
|--------------------------------------|-------------------------------------------------------------------------------------------------------|
| **Identify Key Columns**             | Determine which columns in your dataset can be combined to create a unique identifier for each record. Common columns used include `DateTime`, `CallerID`, and `CallID`. |
| **Concatenate Columns**              | Create a new column in your dataset by concatenating the identified key columns. Ensure that the concatenation is consistent and correctly formatted to avoid discrepancies. |
| **Ensure Consistency**               | Make sure that the values in the key columns are consistent and correctly formatted. Any discrepancies can cause errors during the refresh process. For example, ensure that date-time transformations are accurate and consistent. |
| **Avoid High Cardinality**           | High cardinality can negatively impact performance. Where possible, use rounding on high-precision fields to decrease cardinality. For example, you could split highly unique datetime values into separate columns (e.g., month, year, date) or use rounding (e.g., 13.29889 -> 13.3). |
| **Use Metadata Tags**                | Check if there are metadata tags that uniquely identify each row in the semantic model. These tags can be used by the VertiPaq engine to map records accurately. |
| **Test and Validate**                | After creating the unique key, test and validate it to ensure that it correctly identifies each record and does not introduce any errors. This step is crucial for ensuring data integrity and avoiding duplication. |
| **Use Natural Keys When Possible**   | If your data has a natural key (like `OrderID`), use it. Natural keys are often more meaningful and easier to manage. |
| **Avoid Composite Keys**             | Try to avoid using composite keys (keys made up of multiple columns) as they can complicate the data model and slow down performance. |
| **Consistency in Naming Conventions**| Use consistent naming conventions for keys across your data model to make it easier to understand and manage. |
| **Indexing**                         | Properly index your unique keys to improve query performance. In Power BI, this is handled by the VertiPaq engine, which optimizes the data for fast querying. |

### Strategies to Avoid High Cardinality in Power BI

| Strategy                             | Description                                                                                           |
|--------------------------------------|-------------------------------------------------------------------------------------------------------|
| **Use Rounding**                     | For numerical columns with high precision, consider rounding the values to reduce the number of unique entries. For example, round `13.29889` to `13.3`. |
| **Split DateTime Columns**           | Instead of using a single datetime column, split it into separate columns for date and time components (e.g., year, month, day, hour). This reduces the uniqueness of each column. |
| **Aggregate Data**                   | Where possible, aggregate data to a higher level. For example, instead of storing transaction-level data, aggregate it to daily or monthly summaries. |
| **Remove Unnecessary Columns**       | Eliminate columns that are not needed for analysis. This reduces the overall data size and the number of unique values Power BI needs to handle. |
| **Group and Summarize**              | Use Power Query to group data and create summary tables. This can significantly reduce the number of unique values. |
| **Optimize Data Types**              | Ensure that columns are using the most efficient data types. For example, use integer types for numeric columns where possible instead of floating-point types. |
| **Use Custom Columns**               | Create custom columns that combine multiple columns into a single, less unique column. For example, combine `Year` and `Month` into a `YearMonth` column. |
| **Filter Data**                      | Apply filters to reduce the dataset size. For example, only include data from the last few years if older data is not needed for analysis. |

## Steps to Change a Column Type to Date in Power BI

1. **Open Power BI Desktop**: Start by opening your Power BI Desktop application.
2. **Load Your Data**: Load the dataset that contains the column you want to change to a date type.
3. **Open Power Query Editor**: Click on the `Transform Data` button in the Home tab. This will open the Power Query Editor.
4. **Select the Column**: In the Power Query Editor, find and select the column that you want to change to a date type.
5. **Change Data Type**:
   - With the column selected, go to the `Transform` tab.
   - Click on the `Data Type` dropdown in the ribbon.
   - Select `Date` from the list of data types.
6. **Apply Changes**: After changing the data type, click on `Close & Apply` in the Home tab to apply the changes and return to the main Power BI interface.

> Example:

1. **Open Power BI Desktop** and load your data.
2. **Go to the Power Query Editor** by clicking on `Transform Data`.
3. **Select the Column**: Click on the column that you want to change.
4. **Change Data Type**: In the `Transform` tab, click on the `Data Type` dropdown and select `Date`.
5. **Close & Apply**: Click `Close & Apply` to save the changes.

> Best Practices for Changing Column Type to Date

1. **Ensure Consistent Date Format**: Make sure that the date values in your column are consistently formatted. Inconsistent date formats can cause errors when converting the column type.
2. **Use Power Query Editor**: Power Query Editor in Power BI is a powerful tool for transforming and cleaning data. You can use it to change the column type to date.
3. **Handle Text Columns**: If your date column is currently in text format, you can use Power Query Editor to convert it to a date type. This involves parsing the text values into date values.

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1280-limegreen" alt="Total views">
  <p>Refresh Date: 2025-09-05</p>
</div>
<!-- END BADGE -->
