# Lakehouse: Security \& Governance

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-08

------------------------------------------

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Workspace roles in Lakehouse](https://learn.microsoft.com/en-us/fabric/data-engineering/workspace-roles-lakehouse)
- [How lakehouse sharing works](https://learn.microsoft.com/en-us/fabric/data-engineering/lakehouse-sharing)

</details>

<details>
<summary><b>Table of Contents</b> (Click to expand)</summary>

- [Read all SQL endpoint data](#read-all-sql-endpoint-data)
- [Read all Apache Spark and subscribe to events](#read-all-apache-spark-and-subscribe-to-events)
- [Lakehouse Semantic Model](#lakehouse-semantic-model)
- [SQL Analytics Endpoint](#sql-analytics-endpoint)

</details>

> `Lakehouse`is a `specific type of data architecture within Microsoft Fabric`that combines the features of data lakes and data warehouses. `It allows for the storage and processing of both structured and unstructured data`, providing the flexibility of a data lake with the performance and management features of a data warehouse. <br/> <br/>

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/fd102034-660b-4f93-8aa1-ccda4e4d1893" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

| **Permission**                                 | **Definition**                                                                 | **Use Cases**                                                                                                                                                                                                 |
|-----------------------------------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Read all SQL endpoint data                    | This permission allows access to SQL-based data endpoints in Microsoft Fabric. | - `Power BI`: Connecting to semantic models or datasets using DirectQuery or Import mode.<br/>- `Data Factory Pipelines`: Reading from or writing to SQL endpoints as part of ETL/ELT processes.<br/>- `OneLake / Gen2 Data Lake`: SQL endpoints can expose structured views over data stored in the lake.<br/>- `Data Activator / Agents`: Agents may use SQL endpoints to monitor or trigger actions based on data changes.<br/>- `Excel / Office Integration`: Connecting Excel to SQL endpoints for live data refresh and pivot analysis.<br/>- `Third-party BI Tools`: Using Tableau, Qlik, etc., to connect to SQL endpoints.<br/>- `Custom Applications`: Internal apps querying SQL endpoints for real-time dashboards. |
| Read all Apache Spark and subscribe to events | This permission relates to Apache Spark workloads, which are more code and compute intensive. | - `Notebooks`: Running PySpark, Scala, or SparkSQL code for data exploration and transformation.<br/>- `Machine Learning`: Training models using Spark MLlib or integrating with Azure ML.<br/>- `Data Science Workloads`: Performing large-scale data analysis or feature engineering.<br/>- `Copilot & Agents`: If they need to interact with Spark jobs or listen to Spark events (e.g., job completion).<br/>- `Streaming Analytics`: Real-time data processing using Spark Structured Streaming.<br/>- `Data Engineering Pipelines`: Complex transformations and joins across large datasets.<br/>- `Event-Driven Automation`: Triggering workflows or alerts based on Spark job events.<br/>- `Integration with Delta Lake`: Managing transactional data lakes with ACID guarantees. |

<https://github.com/user-attachments/assets/2974bdee-4b02-4750-ba6c-b745215e0f82>

## Read all SQL endpoint data

> Permissions:
>
> - Read <br/>
> - Read All <br/>
> - Subscribe OneLake Events 

> Lakehouse Manage Permissions: 

<img width="550" alt="image" src="https://github.com/user-attachments/assets/a2559d8a-35b9-456b-a14c-81c9bb5d2b9c" /> | 

<img width="550" alt="image" src="https://github.com/user-attachments/assets/2f0c625d-2cbb-43c0-930a-a2ee29eff60f" />

> When `Read all SQL endpoint data`:

<img width="550" alt="image" src="https://github.com/user-attachments/assets/19a31eaf-79e6-4836-a380-75137823e315" />

> `Read` access is granted, you add more permissions.

<img width="800" alt="image" src="https://github.com/user-attachments/assets/2035ae73-f247-493d-905c-d9a3d76ec5f2" />

## Read all Apache Spark and subscribe to events

> Permissions:
>
> - Read <br/>
> - Read All <br/>
> - Subscribe OneLake Events 

<img width="800" alt="image" src="https://github.com/user-attachments/assets/88691b89-1356-49a1-9945-8ec82c21ae3a">

<img width="800" alt="image" src="https://github.com/user-attachments/assets/124e1a5f-728f-4360-bdeb-3e4b86fe33bd">

## Lakehouse Semantic Model

> Permissions:
>
> - Reshare <br/>
> - Build <br/>
> - Write 

<img width="550" alt="image" src="https://github.com/user-attachments/assets/f767acdc-6491-4576-a99e-337cf6f2b37c" />

<img width="800" alt="image" src="https://github.com/user-attachments/assets/a574988f-f78c-43be-b29c-150f67599386">

## SQL Analytics Endpoint 

> Permissions:
>
> - Read <br/>
> - Read Data <br/>
> - Read All 

<img width="550" alt="image" src="https://github.com/user-attachments/assets/969433d1-5ceb-4369-a11f-26a29bb606dd" />

<img width="800" alt="image" src="https://github.com/user-attachments/assets/60241837-759f-44f6-8934-67bb98002ada" />

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-63-limegreen" alt="Total views">
  <p>Refresh Date: 2025-07-17</p>
</div>
<!-- END BADGE -->
