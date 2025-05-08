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

- [Read all data using SQL](#read-all-data-using-sql)
- [Read all OneLake data and subscribe to events](#read-all-onelake-data-and-subscribe-to-events)
- [Build reports on the default semantic models](#build-reports-on-the-default-semantic-models)
- [Monitor queries](#monitor-queries)
- [Audit queries](#audit-queries)
- [Share granted permissions](#share-granted-permissions)

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

> Permissions:
>
> - Read <br/>
> - Read Data

<img width="700" alt="image" src="https://github.com/user-attachments/assets/a7e4b48d-cefb-447f-8f50-e4f1499444e3">

<img width="700" alt="image" src="https://github.com/user-attachments/assets/6fc51fef-8fd9-4f5c-9b2d-2944e02a21de" />

> Here you can grant: <br/>
>
> - Reshare <br/>
> - Build <br/>
> - Write 

<img width="700" alt="image" src="https://github.com/user-attachments/assets/b4330145-f98e-40e0-b10b-441597749d45" />

<img width="700" alt="image" src="https://github.com/user-attachments/assets/92283e55-0260-46b7-b683-12f50eb84e46" />

## Read all OneLake data and subscribe to events

> Permissions:
>
> - Read <br/>
> - Read All <br/>
> - Subscribe OneLake Events 

<img width="700" alt="image" src="https://github.com/user-attachments/assets/8f16dce7-aaf6-46c4-b5c6-b4f14bf88353">

<img width="700" alt="image" src="https://github.com/user-attachments/assets/a368c386-4ada-411a-b83d-54222139e603" />

## Build reports on the default semantic models

> Permissions:
>
> - Read <br/>

<img width="700" alt="image" src="https://github.com/user-attachments/assets/43d1685f-94ca-42fb-a1e3-29e49db63e75">

<img width="700" alt="image" src="https://github.com/user-attachments/assets/fd9a4469-2447-44b0-a50b-c7e9d956770f" />

## Monitor queries

> Permissions:
>
> - Read <br/>
> - Monitor 

<img width="700" alt="image" src="https://github.com/user-attachments/assets/06f59fbc-d595-4265-824b-469ca35fabea">

<img width="700" alt="image" src="https://github.com/user-attachments/assets/50b22d07-9fcd-46d4-a1d3-d35061b74960">

## Audit queries

> Permissions:
>
> - Read <br/>
> - Audit

<img width="700" alt="image" src="https://github.com/user-attachments/assets/24aa044c-9afa-4748-8b43-141fde0d1a1a">

<img width="700" alt="image" src="https://github.com/user-attachments/assets/e40c788b-8d0e-4a9e-9fbe-2afa87214a20">

## Share granted permissions

> Permissions:
>
> - Read <br/>
> - Reshare 

<img width="700" alt="image" src="https://github.com/user-attachments/assets/2e526411-c109-440d-834d-cb9c3c81a31b">

<img width="700" alt="image" src="https://github.com/user-attachments/assets/72e6c5b5-7946-436c-857a-88b69a074cfd">

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
