# Security \& Governance

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-02-03

------------------------------------------


## Lakehouse Permissions 

> `Lakehouse `is a `specific type of data architecture within Microsoft Fabric `that combines the features of data lakes and data warehouses. `It allows for the storage and processing of both structured and unstructured data`, providing the flexibility of a data lake with the performance and management features of a data warehouse. <br/> <br/>

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/fd102034-660b-4f93-8aa1-ccda4e4d1893" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

| **Permission**                                 | **Definition**                                                                 | **Use Cases**                                                                                                                                                                                                 |
|-----------------------------------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Read all SQL endpoint data                    | This permission allows access to SQL-based data endpoints in Microsoft Fabric. | - `Power BI`: Connecting to semantic models or datasets using DirectQuery or Import mode.<br/>- `Data Factory Pipelines`: Reading from or writing to SQL endpoints as part of ETL/ELT processes.<br/>- `OneLake / Gen2 Data Lake`: SQL endpoints can expose structured views over data stored in the lake.<br/>- `Data Activator / Agents`: Agents may use SQL endpoints to monitor or trigger actions based on data changes.<br/>- `Excel / Office Integration`: Connecting Excel to SQL endpoints for live data refresh and pivot analysis.<br/>- `Third-party BI Tools`: Using Tableau, Qlik, etc., to connect to SQL endpoints.<br/>- `Custom Applications`: Internal apps querying SQL endpoints for real-time dashboards. |
| Read all Apache Spark and subscribe to events | This permission relates to Apache Spark workloads, which are more code- and compute-intensive. | - `Notebooks`: Running PySpark, Scala, or SparkSQL code for data exploration and transformation.<br/>- `Machine Learning`: Training models using Spark MLlib or integrating with Azure ML.<br/>- `Data Science Workloads`: Performing large-scale data analysis or feature engineering.<br/>- `Copilot & Agents`: If they need to interact with Spark jobs or listen to Spark events (e.g., job completion).<br/>- `Streaming Analytics`: Real-time data processing using Spark Structured Streaming.<br/>- `Data Engineering Pipelines`: Complex transformations and joins across large datasets.<br/>- `Event-Driven Automation`: Triggering workflows or alerts based on Spark job events.<br/>- `Integration with Delta Lake`: Managing transactional data lakes with ACID guarantees. |

https://github.com/user-attachments/assets/2974bdee-4b02-4750-ba6c-b745215e0f82


<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

