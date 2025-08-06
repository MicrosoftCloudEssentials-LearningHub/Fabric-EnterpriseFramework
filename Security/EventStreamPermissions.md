# Event Stream: Security \& Governance

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-08

------------------------------------------

> `Event Stream` in Microsoft Fabric is a `real-time data ingestion and processing service` that enables users to capture, transform, and route streaming data from various sources. It supports inputs like `Event Hubs`, `IoT devices`, and `custom applications`, and allows routing data to destinations such as `OneLake`, `Data Warehouses`, or `Lakehouses`. Event Streams are ideal for `real-time analytics, monitoring, and alerting scenarios`, providing a scalable and low-latency pipeline for continuously processing and reacting to incoming data events.

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Fabric Eventstream - overview](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/event-streams/overview?tabs=enhancedcapabilities)
- [Manage an eventstream in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/event-streams/manage-eventstream)

</details>

> [!NOTE]
> As now, access to Event Stream is controlled `entirely through workspace roles (Admin, Member, Contributor, Viewer).`
> `There is no support for assigning permissions to individual Event Stream` or managing them through SQL-like GRANT, REVOKE, or DENY statements.

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/66b7a6ec-12fb-4f22-af45-fd481caa3f30" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/1f88430b-8caa-438a-88d8-9675ae461af7" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

> [!IMPORTANT]
> `Workspace roles in Microsoft Fabric (Admin, Member, Contributor, Viewer) grant access to all items within the workspace, not just Event Stream.` This includes Dashboards,
> Semantic Models, Data Warehouses, Notebooks, Pipelines, and more. There is currently no way to assign permissions to Event Stream individually, access is inherited from the user's role in the workspace.

| **Workspace Role** | **Access to Event Stream**                                                                 |
|--------------------|------------------------------------------------------------------------------------------|
| **Admin**          | Full control: create, edit, delete, monitor, and manage permissions for Event Stream.       |
| **Member**         | Can create, edit, and run Event Stream; can also share them with others.                    |
| **Contributor**    | Can create and run Event Stream, but cannot manage permissions or share them.               |
| **Viewer**         | Can view Event Stream and their status but cannot create, edit, or run them.                |

<img width="700" alt="image" src="https://github.com/user-attachments/assets/93ccd9f1-a650-4663-a631-3b2b20434cae" />

<img width="700" alt="image" src="https://github.com/user-attachments/assets/ce0bcfe1-cce2-45e9-81ee-c58e89a7f089" />

<img width="500" alt="image" src="https://github.com/user-attachments/assets/097cb406-b4c8-4d49-88c2-6d4ea8cf7294" />

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1349-limegreen" alt="Total views">
  <p>Refresh Date: 2025-08-06</p>
</div>
<!-- END BADGE -->
