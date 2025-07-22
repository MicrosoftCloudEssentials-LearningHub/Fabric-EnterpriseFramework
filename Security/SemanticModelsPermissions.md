# Semantic Models: Security \& Governance

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-08

------------------------------------------

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [OneLake data access control model (preview)](https://learn.microsoft.com/en-us/fabric/onelake/security/data-access-control-model)
- [Permission model](https://learn.microsoft.com/en-us/fabric/security/permission-model)
- [Manage Direct Lake semantic models](https://learn.microsoft.com/en-us/fabric/fundamentals/direct-lake-manage)

</details>

> Semantic Model is a `curated layer` that provides a `business-friendly view of data`. It abstracts complex data structures into understandable entities, measures, and relationships, enabling users to create reports and perform analysis without needing to write complex queries. E.g `custom data view`.

<div align="center">

  <img width="700" alt="image" src="https://github.com/user-attachments/assets/c46b93b5-4a64-4066-8c30-19a0dbe77c84" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>

</div>

<div align="center">

  <img width="700" alt="image" src="https://github.com/user-attachments/assets/76b8801d-9b32-4e98-9301-0d85ef607346" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>

</div>

| **Permission**                                                        | **Definition**                                                                                      | **Use Cases**                                                                                                                                         |
|----------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Allow recipients to modify this dataset                              | Grants users the ability to make changes to the semantic model, including schema and data updates.  | - `Data Modeling`: Adjusting measures, columns, or relationships.<br/>- `Collaboration`: Co-authoring datasets with team members.                     |
| Allow recipients to share this semantic model                        | Lets users share the semantic model with others.                                                    | - `Team Access`: Granting access to additional users.<br/>- `Self-service BI`: Empowering users to manage access without admin intervention.          |
| Allow recipients to build content with the data associated with this semantic model | Enables users to create reports, dashboards, and other content using the semantic model.            | - `Power BI Reports`: Building visuals and dashboards.<br/>- `Embedded Analytics`: Using the model in apps or portals.<br/>- `Ad hoc Analysis`: Exploring data. |
| Send an email notification                                           | Sends an email to notify the recipient about the access granted.                                    | - `Communication`: Ensuring users are informed of their new access.<br/>- `Onboarding`: Helping users get started with the semantic model.            |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-659-limegreen" alt="Total views">
  <p>Refresh Date: 2025-07-22</p>
</div>
<!-- END BADGE -->
