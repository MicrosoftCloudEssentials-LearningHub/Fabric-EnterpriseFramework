# Healthcare Data Solutions: Security \& Governance

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-08

------------------------------------------

> `Healthcare Data Solution` in Microsoft Fabric is a `comprehensive and secure framework` designed to manage, integrate, and analyze healthcare data across various systems. It enables seamless data movement and transformation using tools like Copy Jobs, Pipelines, and Event Streams, supporting ingestion into `OneLake`, `Data Warehouses`, or `Lakehouses`. Healthcare Data Solutions are ideal for `clinical data integration, regulatory reporting, population health analytics, and interoperability`, providing a scalable and compliant foundation for delivering insights and improving patient outcomes.

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Overview of healthcare data solutions in Microsoft Fabric](https://learn.microsoft.com/en-us/industry/healthcare/healthcare-data-solutions/overview)
- [Compliance and security in healthcare data solutions in Microsoft Fabric](https://learn.microsoft.com/en-us/industry/healthcare/healthcare-data-solutions/compliance?toc=%2Findustry%2Fhealthcare%2Ftoc.json&bc=%2Findustry%2Fbreadcrumb%2Ftoc.json)

</details>

> [!NOTE]
> `There is currently no support for assigning permissions to individual Healthcare Data Solutions`, nor can access be managed using SQL-like `GRANT`, `REVOKE`, or `DENY` statements.  
> For healthcare organizations handling regulated data (e.g., PHI or clinical records), it's essential to structure workspaces carefully and apply role-based access control (RBAC) at the workspace level to maintain compliance and data governance.

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/6f3a21b9-a38e-438d-821b-9e4fe73bf3b7" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/25dede78-ef39-497c-a9da-3d86d9ad24f7" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

> [!IMPORTANT]
> `Workspace roles in Microsoft Fabric (Admin, Member, Contributor, Viewer) grant access to all items within the workspace, not just Healthcare Data Solutions.` This includes Dashboards,
> Semantic Models, Data Warehouses, Notebooks, Pipelines, and more. There is currently no way to assign permissions to Healthcare Data Solutions individually, access is inherited from the user's role in the workspace.

| **Workspace Role** | **Access to Healthcare Data Solutions**                                                                 |
|--------------------|------------------------------------------------------------------------------------------|
| **Admin**          | Full control: create, edit, delete, monitor, and manage permissions for Healthcare Data Solutions.       |
| **Member**         | Can create, edit, and run Healthcare Data Solutions; can also share them with others.                    |
| **Contributor**    | Can create and run Healthcare Data Solutions, but cannot manage permissions or share them.               |
| **Viewer**         | Can view Healthcare Data Solutions and their status but cannot create, edit, or run them.                |

<img width="700" alt="image" src="https://github.com/user-attachments/assets/93ccd9f1-a650-4663-a631-3b2b20434cae" />

<img width="700" alt="image" src="https://github.com/user-attachments/assets/ce0bcfe1-cce2-45e9-81ee-c58e89a7f089" />

<img width="500" alt="image" src="https://github.com/user-attachments/assets/097cb406-b4c8-4d49-88c2-6d4ea8cf7294" />

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-659-limegreen" alt="Total views">
  <p>Refresh Date: 2025-07-22</p>
</div>
<!-- END BADGE -->
