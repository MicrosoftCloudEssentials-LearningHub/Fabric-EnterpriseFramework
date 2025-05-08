# Warehouse: Security \& Governance

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-08

------------------------------------------

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Security for data warehousing in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-warehouse/security)
- [Permission model](https://learn.microsoft.com/en-us/fabric/security/permission-model)
- [Share your data and manage permissions](https://learn.microsoft.com/en-us/fabric/data-warehouse/share-warehouse-manage-permissions)

</details>

<details>
<summary><b>Table of Contents</b> (Click to expand)</summary>

</details>

> `Data Warehouse` is a centralized repository for `storing large volumes of structured data`. It is optimized for querying and analysis, providing high-performance SQL-based analytics.

<div align="center">

  <img width="700" alt="image" src="https://github.com/user-attachments/assets/0a204dbf-af7a-434a-8265-65cc40fa4dc8" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>

</div>

| **Permission**                                 | **Definition**                                                                 | **Use Cases**                                                                                                                                                                                                 |
|-----------------------------------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Read all data using SQL (`ReadData`)          | Allows querying all data in the warehouse using SQL.                           | - `Power BI` or `Excel`: Running SQL queries for reporting.<br/>- `Data Factory`: Using SQL queries in pipelines.<br/>- `Custom Apps`: Querying warehouse data for dashboards or APIs. |
| Read all OneLake data and subscribe to events (`ReadAll`, `SubscribeOneLakeEvents`) | Grants access to all data stored in OneLake and allows subscribing to data change events. | - `Data Pipelines`: Reading raw or curated data from OneLake.<br/>- `Event-driven Workflows`: Triggering actions when data changes.<br/>- `Monitoring Tools`: Subscribing to data refresh or ingestion events. |
| Build reports on the default semantic model (`Build`) | Allows building and publishing reports using the default semantic model.       | - `Power BI`: Creating dashboards and reports.<br/>- `Collaborative BI`: Sharing insights across teams.<br/>- `Embedded Analytics`: Integrating reports into apps or portals. |
| Monitor queries (`Monitor`)                   | Enables visibility into query performance and execution.                       | - `Performance Tuning`: Identifying slow queries.<br/>- `Operational Monitoring`: Tracking query load and usage.<br/>- `Capacity Planning`: Understanding resource consumption. |
| Audit queries (`Audit`) – PREVIEW             | Allows auditing of query activity for compliance and governance.               | - `Security Audits`: Reviewing who queried what and when.<br/>- `Compliance Reporting`: Ensuring data access policies are followed.<br/>- `Anomaly Detection`: Spotting unusual query patterns. |
| Share granted permissions (`Reshare`)         | Allows users to share permissions they’ve been granted with others.            | - `Collaboration`: Delegating access to teammates.<br/>- `Data Stewardship`: Empowering trusted users to manage access.<br/>- `Self-service BI`: Enabling broader access without admin bottlenecks. |

<https://github.com/user-attachments/assets/ee3daf56-9aca-4321-b154-35cfbae05f65>

## Read all data using SQL 

## Read all OneLake data and subscribe to events

## Build reports on the default semantic models

## Monitor queries

## Audit queries

## Share granted permissions

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
