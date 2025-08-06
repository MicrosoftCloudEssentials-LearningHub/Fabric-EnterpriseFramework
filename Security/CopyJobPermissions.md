# Copy Job: Security \& Governance

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-08

------------------------------------------

> `Copy Job` in Microsoft Fabric is a `data movement operation` that enables users to transfer data from one location to another within the Fabric ecosystem or from external sources. It supports a wide range of connectors and formats, allowing seamless ingestion into `OneLake`, `Data Warehouses`, or `Lakehouses`. Copy Jobs are ideal for `ETL/ELT workflows, data onboarding, and integration scenarios`, providing a scalable and efficient way to automate data loading and refresh processes across environments.

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [What is the Copy job in Data Factory for Microsoft Fabric?](https://learn.microsoft.com/en-us/fabric/data-factory/what-is-copy-job)
- [Learn how to create a Copy job in Data Factory for Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-factory/create-copy-job)

</details>

> [!NOTE]
> As now, access to Copy Jobs is controlled `entirely through workspace roles (Admin, Member, Contributor, Viewer).`
> `There is no support for assigning permissions to individual Copy Jobs` or managing them through SQL-like GRANT, REVOKE, or DENY statements.

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/6f7d1d11-733a-492f-b63e-0da371908e35" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

> [!IMPORTANT]
> `Workspace roles in Microsoft Fabric (Admin, Member, Contributor, Viewer) grant access to all items within the workspace, not just Copy Jobs.` This includes Dashboards,
> Semantic Models, Data Warehouses, Notebooks, Pipelines, and more. There is currently no way to assign permissions to Copy Jobs individually, access is inherited from the user's role in the workspace.

| **Workspace Role** | **Access to Copy Jobs**                                                                 |
|--------------------|------------------------------------------------------------------------------------------|
| **Admin**          | Full control: create, edit, delete, monitor, and manage permissions for Copy Jobs.       |
| **Member**         | Can create, edit, and run Copy Jobs; can also share them with others.                    |
| **Contributor**    | Can create and run Copy Jobs, but cannot manage permissions or share them.               |
| **Viewer**         | Can view Copy Jobs and their status but cannot create, edit, or run them.                |

<img width="700" alt="image" src="https://github.com/user-attachments/assets/93ccd9f1-a650-4663-a631-3b2b20434cae" />

<img width="700" alt="image" src="https://github.com/user-attachments/assets/ce0bcfe1-cce2-45e9-81ee-c58e89a7f089" />

<img width="500" alt="image" src="https://github.com/user-attachments/assets/097cb406-b4c8-4d49-88c2-6d4ea8cf7294" />

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1349-limegreen" alt="Total views">
  <p>Refresh Date: 2025-08-06</p>
</div>
<!-- END BADGE -->
