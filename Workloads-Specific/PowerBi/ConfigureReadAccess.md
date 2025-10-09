# Demostration: How to Configure Read Access

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-21

-----------------------------------------

> **Microsoft Fabric** is an all-in-one data analytics solution that integrates various Azure data workloads with Power BI, enabling comprehensive data management, analysis, and visualization within a single environment. Fabric consolidates data movement, data science, real-time analytics, and business intelligence, making it easier to derive meaningful insights from your data.
> **Fabric F64** is a specific capacity SKU within Microsoft Fabric that provides enhanced features and capabilities for data analytics. `It allows users to view Power BI content without a per-user license, provided they are assigned the appropriate roles and added to the capacity`.

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Microsoft Fabric features by SKU](https://learn.microsoft.com/en-us/fabric/enterprise/fabric-features)
- [Getting Started with Microsoft Fabric](https://www.microsoft.com/en-us/microsoft-fabric/getting-started)
- [Roles in workspaces in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/get-started/roles-workspaces)
- [Permission model - Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/security/permission-model)
- [Query the SQL analytics endpoint of your SQL database in Fabric](https://learn.microsoft.com/en-us/fabric/database/sql/query-sql-analytics-endpoint)
- [Use the SQL analytics endpoint to query data](https://learn.microsoft.com/en-us/fabric/database/sql/tutorial-use-analytics-endpoint)
- [Apache Spark Runtimes in Fabric](https://learn.microsoft.com/en-us/fabric/data-engineering/runtime)
- [Model data in the default Power BI semantic model in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-warehouse/default-power-bi-semantic-model)
- [Create reports on data warehousing in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-warehouse/create-reports)
- [What is the SQL analytics endpoint for a lakehouse?](https://learn.microsoft.com/en-us/fabric/data-engineering/lakehouse-sql-analytics-endpoint)
- [What is a lakehouse in Microsoft Fabric?](https://learn.microsoft.com/en-us/fabric/data-engineering/lakehouse-overview)
- [Default Power BI semantic models in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-warehouse/semantic-models)
- [How lakehouse sharing works](https://learn.microsoft.com/en-us/fabric/data-engineering/lakehouse-sharing)
- [Tutorial: Stream and consume events to and from Real-Time Intelligence by using an Apache Kafka endpoint in an eventstream](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/event-streams/stream-consume-events-use-kafka-endpoint)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Overview](#overview)
- [Viewer Role in Fabric Workspaces](#viewer-role-in-fabric-workspaces)
- [Granting Read and ReadData Access to the Semantic Model](#granting-read-and-readdata-access-to-the-semantic-model)
- [SQL Analytics Endpoint in Fabric](#sql-analytics-endpoint-in-fabric)
- [Granting App Audience in Fabric](#granting-app-audience-in-fabric)

</details>

## Overview

 **Create a Fabric Capacity**: Follow the prompts to configure and create the capacity.

<img width="550" alt="image" src="https://github.com/user-attachments/assets/8f259cac-1dcb-4129-9070-0b31899c4ab4">

## Viewer Role in Fabric Workspaces

> `Fabric Workspaces` in Microsoft Fabric are `collaborative environments where users can manage, analyze, and visualize data`. These workspaces integrate various data services and tools, providing a `unified platform for data professional`s to work together

| **Capability**         | **Description**                                                                                                                                                                                                 |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **View All Content**   | - Users can view dashboards, reports, workbooks, and other content within the workspace. <br> - This includes content created by other users, enabling collaboration and shared insights.                        |
| **Interact with Content** | - Users can interact with the content, such as filtering and highlighting data. <br> - They can drill down into reports and dashboards to explore data in more detail. <br> - However, they cannot modify the content, ensuring that the integrity of the reports and dashboards is maintained. |
| **Read Data**          | - Users can read data from various sources within the workspace. <br> - This includes accessing data from SQL analytics endpoints and Lakehouse data. <br> - They can use this data to gain insights and make data-driven decisions without altering the underlying data sources. |
| **View Notebooks and Lakehouses** | - Users can view notebooks, lakehouses, and everything within those lakehouses. <br> - This includes accessing and reading data stored in lakehouses, enabling comprehensive data analysis and insights. |
| **View Other Objects and Artifacts** | - Users can view additional objects and artifacts such as data pipelines, Spark job definitions, ML models, experiments, and eventstreams. <br> - This ensures users have a comprehensive view of all relevant data and processes within the workspace. |

<img width="550" alt="image" src="https://github.com/user-attachments/assets/5b84e72c-f353-480d-b1f1-074d0be30b8e" />

<img width="550" alt="image" src="https://github.com/user-attachments/assets/79edb3ff-5177-4940-9094-be20d3ea65bb" />

> For information about other roles, please visit [Roles in workspaces in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/get-started/roles-workspaces). For details on the Fabric security permissions model, refer to [Permission model - Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/security/permission-model).

| **Role**       | **Description**                                                                                                                                       |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Admin**      | - Full control over the workspace, including managing permissions and settings. <br> - Can create, edit, and delete content within the workspace.     |
| **Member**     | - Can view and edit content within the workspace. <br> - Can create new reports, dashboards, and datasets.                                            |
| **Contributor**| - Similar to Member, but cannot delete content created by others. <br> - Can contribute to existing reports and dashboards.                           |

<img width="948" alt="image" src="https://github.com/user-attachments/assets/5a2f06f3-425c-48f4-ad40-f7674b25dcf0" />

## Granting Read and ReadData Access to the Semantic Model

> Semantic Model: Provides a logical description of an analytical domain using business-friendly terminology and metrics.

Capabilities:

- Data Representation: Organizes data into a star schema with facts and dimensions.
- Business Logic: Inherits business logic from parent lakehouses or warehouses.
- Visualization: Supports creating Power BI reports and dashboards for visual analysis.

<img width="550" alt="image" src="https://github.com/user-attachments/assets/d78fcd11-779f-48f6-8539-85c751be2a5a" />

| **Permission** | **Purpose**| **Capabilities**| **Restrictions**|
|----------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Modify Dataset** | Allows recipients to modify the dataset. | - Edit and update the dataset <br> - Make changes to the data structure and content <br> - Manage dataset settings (e.g., refresh schedules, data source credentials) | - Cannot share the dataset unless granted additional sharing permissions |
| **Share Semantic Model** | Allows recipients to share the semantic model with others. | - Grant access to the semantic model to other users or groups <br> - Collaborate with others using the shared model | - Cannot modify the semantic model unless granted additional modification permissions |
| **Build Content** | Allows recipients to build content with the data associated with the semantic model. | - Create new reports, dashboards, and datasets using the semantic model data <br> - Perform data analysis and generate insights <br> - Integrate data with other tools and platforms | - Cannot modify the semantic model or dataset unless granted additional modification permissions |
| **Send Email Notification** | Sends an email notification to the recipient about the granted access. | - Notify recipients via email about their new permissions <br> - Ensure recipients are aware of their access rights | - Does not grant any additional data access or modification capabilities |

<img width="550" alt="image" src="https://github.com/user-attachments/assets/ad4ab52a-b222-436d-811e-fa6b454621c9" />

## SQL Analytics Endpoint in Fabric

> Lakehouse: A data architecture platform for storing, managing, and analyzing both structured and unstructured data.
Capabilities:

- Data Storage: Combines the capabilities of data lakes and data warehouses.
- SQL Analytics Endpoint: Provides a SQL-based experience for querying data.
- Automatic Table Discovery: Automatically registers and validates tables.

> SQL Analytics Endpoint: Allows users to query data in the lakehouse using SQL.
Capabilities:

- T-SQL Queries: Supports T-SQL language for querying Delta tables.
- Read-Only Mode: Operates in read-only mode, allowing data analysis without modifying the data.
- Security: Implements SQL security for access control.

> Apache Endpoint: Used for real-time data streaming and processing.
Capabilities:

- Event Streaming: Streams events to and from Real-Time Intelligence using Apache Kafka.
- Integration: Integrates with event streams to process and route real-time events.
- Scalability: Supports building scalable, real-time data systems.

<img width="550" alt="image" src="https://github.com/user-attachments/assets/bb835f14-3883-422b-a3c4-3f49f7b8f15e" />

| **Permission** | **Purpose**                                                                                          | **Capabilities**                                                                                     | **Restrictions**                                                                                     |
|----------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| **Read All SQL Endpoint Data** | Allows users to access data without SQL policy restrictions, enabling them to perform detailed queries and analysis. | - Access and read data from SQL analytics endpoints <br> - Perform detailed queries and analysis | - Cannot modify the data <br> - Cannot manage permissions or grant access to other users |
| **Read All Apache Spark** | Grants access to all data using Apache Spark, providing a broader scope of data access for advanced analytics. | - Access all data using Apache Spark <br> - Perform advanced analytics and data processing | - Cannot modify the data <br> - Cannot manage permissions or grant access to other users |
| **Build Reports on the Default Semantic Model** | Allows users to create reports using the default Power BI semantic model. | - Create new reports and dashboards using the default semantic model <br> - Perform data analysis and generate insights <br> - Integrate data with other tools and platforms | - Cannot modify the semantic model or dataset unless granted additional modification permissions |

<img width="550" alt="image" src="https://github.com/user-attachments/assets/10e84fab-7213-45e3-8d7c-ca9bf06aad2b" />

## Granting App Audience in Fabric

> When you create and publish an app in Power BI within Fabric, you can define multiple audiences for the app. This allows you to control who can view specific content within the app.

Granting app audience permissions enables the assigned identity to:

- View the app content, including dashboards and reports.
- Interact with the app, such as filtering and highlighting data.
- Access different content based on the audience group they belong to.

Click here for [Demostration: How to Configure Workspace App](./ConfigureWorkspaceApp.md)

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1280-limegreen" alt="Total views">
  <p>Refresh Date: 2025-09-05</p>
</div>
<!-- END BADGE -->
