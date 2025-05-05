# Purview - Best Practices Overview

Costa Rica

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com)
[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-05

----------

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Use Microsoft Purview to govern Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/governance/microsoft-purview-fabric)
- [Governance overview and guidance](https://learn.microsoft.com/en-us/fabric/governance/governance-compliance-overview)
- [Metadata scanning overview](https://learn.microsoft.com/en-us/fabric/governance/metadata-scanning-overview)

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

3. **Where to monitor**: Once scanning is active, go to the **Purview hub in Fabric** to view registered items, lineage graphs, and metadata properties.

### 3. **View and Explore the Unified Catalog**

- Once scanning is active, go to the **“Data Catalog”** section within the Purview hub.
- Here, you can:
  - Search for datasets, models, and reports.
  - View **metadata** such as schema, owner, last modified date.
  - See **data lineage**—how data flows from source to report.
  - Filter by sensitivity labels, endorsements, or domains.

### 4. **Use Lineage for Impact Analysis**

- Click on any item to view its **lineage graph**.
- This shows upstream and downstream dependencies (e.g., a semantic model feeding into multiple reports).
- Use this to assess the impact of changes or troubleshoot data issues.

### 5. **Promote Discoverability**

- Add **descriptions, tags, and endorsements** to important items.
- This helps other users find and trust the right data assets.
- Encourage data producers to maintain metadata hygiene.

## Sensitivity Labeling 

> Apply sensitivity labels to all Fabric items (e.g., Lakehouses, semantic models, reports) using `Microsoft Purview Information Protection`. Labels persist across exports and help enforce data protection policies. Regularly audit label usage and ensure labels align with your data classification framework.

## Data Loss Prevention (DLP)

> Implement DLP policies for Power BI semantic models to prevent accidental data leaks. Define rules that restrict sharing or exporting sensitive data. Monitor DLP alerts and refine policies based on usage patterns.

## End-to-End Lineage

> Enable data lineage tracking to visualize how data flows from sources (e.g., OneLake, SQL, Cosmos DB) through transformations to reports. Use this to assess impact before making changes and to support compliance audits.

## Role-Based Governance

> Use tenant, domain, and workspace-level settings to delegate governance responsibilities. Platform admins should define global policies, while domain and workspace admins manage local configurations. This supports scalability and autonomy.

## Trust & Endorsement

> Encourage data producers to endorse trusted datasets and models. Use tags and descriptions to improve discoverability and promote reuse. This builds a culture of data trust and reduces duplication.

## Monitoring & Auditing

> Use the Purview hub in Fabric to monitor sensitivity labels, DLP activity, and data access. Regularly review audit logs to detect anomalies and ensure compliance with internal and external regulations.

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
