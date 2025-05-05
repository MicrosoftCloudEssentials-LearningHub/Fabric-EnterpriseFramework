# Purview - Best Practices Overview

Costa Rica

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com)
[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-05

----------

> Use the Purview hub in Fabric to monitor sensitivity labels, DLP activity, and data access. Regularly review audit logs to detect anomalies and ensure compliance with internal and external regulations.

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Use Microsoft Purview to govern Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/governance/microsoft-purview-fabric)
- [Governance overview and guidance](https://learn.microsoft.com/en-us/fabric/governance/governance-compliance-overview)
- [Metadata scanning overview](https://learn.microsoft.com/en-us/fabric/governance/metadata-scanning-overview)
- [Get started with sensitivity labels](https://learn.microsoft.com/en-us/purview/get-started-with-sensitivity-labels)

</details>

<details>
<summary><b>Table of Content</b> (Click to expand)</summary>

- [Unified Data Catalog](#unified-data-catalog)
- [Sensitivity Labeling](#sensitivity-labeling)
- [Data Loss Prevention DLP](#data-loss-prevention-dlp)
- [End-to-End Lineage](#end-to-end-lineage)
- [Role-Based Governance](#role-based-governance)
- [Trust & Endorsement](#trust--endorsement)
- [Monitoring & Auditing](#monitoring--auditing)

</details>

> [!NOTE]
> Below is how to upgrade from `Free` account.

> `Purview Free`: Provides basic data governance capabilities, suitable for small-scale or initial exploration of Purview’s features. It includes basic cataloging, limited data discovery, and basic compliance tools. <br/>
> `Purview Enterprise`: Offers comprehensive data governance, protection, and compliance features. It supports a wide range of data sources, advanced classification, full DLP, information protection, compliance management, and seamless integration with Azure services.

<details>
<summary><b> Detailed Table: Free vs Enterprise </b> (Click to expand)</summary>

| **Feature**                        | **Purview Free**                                                                                       | **Purview Enterprise**|
|------------------------------------|---------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| **Data Catalog**                   | Basic cataloging capabilities. <br> Limited to 1,000 annotated assets.| Full cataloging capabilities. <br> No limit on the number of annotated assets.|
| **Data Discovery**                 | Limited to Azure and Microsoft Fabric resources. <br> Auto discovery of Azure data sources.| Supports a wide range of data sources, including on-premises, multicloud, and SaaS applications. <br> Automated scans for the hybrid data estate.       |
| **Data Lineage**                   | Basic lineage tracking for a limited set of data sources.| Comprehensive lineage tracking across all supported data sources.|
| **Data Classification**            | Basic classification capabilities. <br> Definition and manual application of classifications and terms.| Advanced classification with automatic labeling and sensitivity labels. <br> Automated application of classifications and terms.|
| **Data Loss Prevention (DLP)**     | Not included.| Full DLP capabilities to prevent unauthorized sharing of sensitive information.|
| **Information Protection**         | Not included.| Includes encryption and access controls to protect sensitive data.|
| **Compliance Management**          | Basic compliance tools.| Comprehensive compliance management, including Compliance Manager and audit capabilities.              |
| **Data Quality**                   | Basic data profiling.| Advanced data quality features, including quality rules and continuous monitoring.                     |
| **Insider Risk Management**        | Not included.| Full insider risk management capabilities to detect and respond to potential data leaks.|
| **eDiscovery**| Not included.| Full eDiscovery capabilities for legal and compliance investigations.|
| **Integration with Azure Services**| Limited integration with Azure services.| Seamless integration with a wide range of Azure services, including Synapse Analytics, SQL, and Power BI. |
| **Data Map**                       | Basic data map capabilities. <br> Manual creation of assets using the data map APIs.| Full data map with detailed visualizations and relationship tracking. <br> Full use of Microsoft Purview's REST APIs.|
| **Monitoring and Reporting**       | Basic monitoring and reporting.| Advanced monitoring and reporting, including Data Estate Insights.|
| **User Access**                    | Limited to data curators. <br> Role group access control to platform and apps.| Full access for all users, including data stewards and analysts. <br> Fine-grained, collection-level access control to platform and apps.|
| **Support and SLA**                | Community support.| Enterprise-grade support and SLA.|
| **Workflows**                      | Not included.                                                                                     | Included.|
| **Business Rules**                 | Not included.| Included.|
| **Support for Business Assets and Managed Attributes** | Not included.| Included.|
| **Descriptions, Tags, and Contacts** | Manual descriptions, tags, and contacts.| Manual and bulk descriptions, tags, and contacts.|

</details>

<https://github.com/user-attachments/assets/9d644322-d3fc-4827-92d3-a623e39e55de>

## Unified Data Catalog

> Use the Microsoft Purview Unified Catalog to automatically register and view metadata for Fabric items. This helps users discover datasets, semantic models, and reports with full lineage and context. Ensure metadata scanning is enabled across all Fabric workspaces.

> [!IMPORTANT]
>
> - **Admins** can configure scanning policies and permissions in the **Microsoft Purview governance portal**. <br/>
> - Ensure that **Fabric is registered as a data source** in Purview. <br/>
> - Use **role-based access control (RBAC)** to manage who can view or edit catalog metadata.

### 1. **Access the Purview Hub in Fabric**

- Go to the [Microsoft Fabric portal](https://app.fabric.microsoft.com/)
- Click on ⚙️, select **“Purview hub”**.
- This is your central place for managing governance, metadata, and data protection across Fabric.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/9f22b062-051f-41b3-b480-4c109d332a57" />  

    <https://github.com/user-attachments/assets/cf5f5a25-29bd-4b78-9d3c-c926026e13be>

### 2. **Enable Metadata Scanning**

> Ensure that **metadata scanning is enabled** for all relevant Fabric workspaces.
> This allows Purview to automatically discover and register items like: Lakehouses, Dataflows, Semantic models, Reports <br/>
>
> - Scanning can be configured at the **workspace level** or **tenant level** by an admin.

1. **Configure tenant settings**:
   - In the [Fabric admin portal](https://app.fabric.microsoft.com/), go to **Tenant Settings**.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/39bcb3a0-a794-4fd4-9bbb-6062b067bca2" />

   - Enable detailed metadata scanning, and allow service principal access:
    
        <https://github.com/user-attachments/assets/276cf0bd-e388-4b59-89b3-5a07de214ae8>

2. **Run a scan**:
     - Use the **Purview portal** or **scanner APIs** to initiate a scan.
     - You can perform full, incremental, or scoped scans depending on your governance needs.

       <https://github.com/user-attachments/assets/a815517c-f19a-41a7-a4eb-efbaf138a883>

3. **Where to monitor**: Once scanning is active, go to the **Purview hub in Fabric** to view registered items, lineage graphs, and metadata properties.

### 3. **View and Explore the Unified Catalog**

- Once scanning is active, go to the `Data Map` section within the [Purview hub](
- Here, you can:
  - Search for datasets, models, and reports.
  - View **metadata** such as schema, owner, last modified date.
  - See **data lineage** (e.g how data flows from source to report).
  - Filter by sensitivity labels, endorsements, or domains.
- Use Lineage for Impact Analysis
    - Click on any item to view its **lineage graph**.
    - This shows upstream and downstream dependencies (e.g., a semantic model feeding into multiple reports).
    - Use this to assess the impact of changes or troubleshoot data issues.


      https://github.com/user-attachments/assets/846f63f1-9d53-45ae-9812-9375b93d139f

- Promote Discoverability
    - Add **descriptions, tags, and endorsements** to important items.
    - This helps other users find and trust the right data assets.
    - Encourage data producers to maintain metadata hygiene.

## Sensitivity Labeling 

> Apply sensitivity labels to all Fabric items (e.g., Lakehouses, semantic models, reports) using `Microsoft Purview Information Protection`. Labels persist across exports and help enforce data protection policies. Regularly audit label usage and ensure labels align with your data classification framework. Click [Learn about sensitivity labels](https://learn.microsoft.com/en-us/purview/sensitivity-labels).

## Data Loss Prevention (DLP)

> Implement DLP policies for Power BI semantic models to prevent accidental data leaks. Define rules that restrict sharing or exporting sensitive data. Monitor DLP alerts and refine policies based on usage patterns. Click to [Learn about data loss prevention](https://learn.microsoft.com/en-us/purview/dlp-learn-about-dlp)

## End-to-End Lineage

> Enable data lineage tracking to visualize how data flows from sources (e.g., OneLake, SQL, Cosmos DB) through transformations to reports. Use this to assess impact before making changes and to support compliance audits. Click [Data lineage user guide](https://learn.microsoft.com/en-us/purview/data-governance-classic-lineage-user-guide)

## Role-Based Governance

> Use tenant, domain, and workspace-level settings to delegate governance responsibilities. Platform admins should define global policies, while domain and workspace admins manage local configurations. This supports scalability and autonomy. Click [Data governance roles and permissions in Microsoft Purview](https://learn.microsoft.com/en-us/purview/data-governance-roles-permissions)

## Trust & Endorsement

> Encourage data producers to endorse trusted datasets and models. Use tags and descriptions to improve discoverability and promote reuse. This builds a culture of data trust and reduces duplication. Click [Govern your Fabric data](https://learn.microsoft.com/en-us/fabric/governance/onelake-catalog-govern)


<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
