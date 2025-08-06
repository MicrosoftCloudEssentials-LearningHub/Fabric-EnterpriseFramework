# Data Pipelines: Security \& Governance

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-08

------------------------------------------

> `Data Pipeline` in Microsoft Fabric is a `workflow orchestration tool` that enables users to design, schedule, and manage
> complex data workflows across various services and environments. It supports activities like `Copy Jobs`, `Data Flows`, `Notebook executions`, and
> `Spark jobs`, allowing seamless integration between `OneLake`, `Data Warehouses`, `Lakehouses`, and external sources.
> Data Pipelines are ideal for `ETL/ELT automation, data transformation, and end-to-end data integration`, providing a scalable and visual interface for building reliable and repeatable data processes.

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Concept: Data pipeline Runs](https://learn.microsoft.com/en-us/fabric/data-factory/pipeline-runs)
- [Quickstart: Move and transform data with dataflows and data pipelines](https://learn.microsoft.com/en-us/fabric/data-factory/transform-data)
- [Ingest data into your Warehouse using data pipelines](https://learn.microsoft.com/en-us/fabric/data-warehouse/ingest-data-pipelines)

</details>

> [!NOTE]  
> As of now, access to **Data Pipelines** is controlled `entirely through workspace roles (Admin, Member, Contributor, Viewer).`  
> `There is no support for assigning permissions to individual Data Pipelines` or managing them through SQL-like `GRANT`, `REVOKE`, or `DENY` statements.

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/3d68fb14-8da1-4d6f-8059-360748252bfb" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

> [!IMPORTANT]  
> `Workspace roles in Microsoft Fabric (Admin, Member, Contributor, Viewer) grant access to all items within the workspace, not just Data Pipelines.` This includes Dashboards, Semantic Models, Data Warehouses, Notebooks, Copy Jobs, and more.  There is currently no way to assign permissions to Data Pipelines individually, access is inherited from the user's role in the workspace.

| **Workspace Role** | **Access to Data Pipelines**                                                                 |
|--------------------|-----------------------------------------------------------------------------------------------|
| **Admin**          | Full control: create, edit, delete, monitor, and manage permissions for Data Pipelines.       |
| **Member**         | Can create, edit, and run Data Pipelines; can also share them with others.                    |
| **Contributor**    | Can create and run Data Pipelines, but cannot manage permissions or share them.               |
| **Viewer**         | Can view Data Pipelines and their status but cannot create, edit, or run them.                |

<img width="700" alt="image" src="https://github.com/user-attachments/assets/93ccd9f1-a650-4663-a631-3b2b20434cae" />

<img width="700" alt="image" src="https://github.com/user-attachments/assets/ce0bcfe1-cce2-45e9-81ee-c58e89a7f089" />

<img width="500" alt="image" src="https://github.com/user-attachments/assets/097cb406-b4c8-4d49-88c2-6d4ea8cf7294" />

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1349-limegreen" alt="Total views">
  <p>Refresh Date: 2025-08-06</p>
</div>
<!-- END BADGE -->
