# Demostration: How to Configure Power Bi Cloud Connections \& Gateways

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-21

------------------------------------------

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Create and share cloud data sources in the Power BI service](https://learn.microsoft.com/en-us/power-bi/connect-data/service-create-share-cloud-data-sources)
- [Connect to cloud data sources in the Power BI service](https://learn.microsoft.com/en-us/power-bi/connect-data/service-connect-cloud-data-sources)
- [Manage users around Cloud Connections](https://learn.microsoft.com/en-us/fabric/data-factory/data-source-management#manage-users)
- [Migrate from Azure Analysis Services to Power BI Premium](https://learn.microsoft.com/en-us/power-bi/guidance/migrate-azure-analysis-services-to-powerbi-premium)
- [On-premises and virtual network (VNet) data gateways documentation](https://learn.microsoft.com/en-us/data-integration/gateway/)
- [What is an on-premises data gateway?](https://learn.microsoft.com/en-us/data-integration/gateway/service-gateway-onprem)
- [What is a virtual network (VNet) data gateway?](https://learn.microsoft.com/en-us/data-integration/vnet/overview)
- [Set privacy levels (Power Query) details](https://support.microsoft.com/en-us/office/set-privacy-levels-power-query-cc3ede4d-359e-4b28-bc72-9bee7900b540?ui=en-us&rs=en-us&ad=us)
- [What is the admin monitoring workspace? (Preview)](https://learn.microsoft.com/en-us/fabric/admin/monitoring-workspace)
- [Feature usage and adoption report (preview)](https://learn.microsoft.com/en-us/fabric/admin/feature-usage-adoption)
- [Manage security roles of an on-premises data gateway](https://learn.microsoft.com/en-us/data-integration/gateway/manage-security-roles)
- [Virtual network (virtual network) data gateway FAQs](https://learn.microsoft.com/en-us/data-integration/vnet/data-gateway-faqs)

</details>

<details>
<summary><b>Table of Contents</b> (Click to expand)</summary>
  
- [How to Manage Cloud connections](#how-to-manage-cloud-connections)
  - [Creating Shareable Connections](#creating-shareable-connections)
  - [Managing Connections](#managing-connections)
- [Admin Monitoring Workspace](#admin-monitoring-workspace)
- [Identify Access per report](#identify-access-per-report)
- [Restrict Access from new gateway connections](#restrict-access-from-new-gateway-connections)
  - [On-premises Data Gateways](#on-premises-data-gateways)
  - [Virtual Network VNet Data Gateways](#virtual-network-vnet-data-gateways)

</details>

## How to Manage Cloud connections

Managing cloud connections in Power BI, below you can find differences between personal and shareable cloud connections:

> [!NOTE]
> `When you publish a .PBIX file` from Power BI Desktop that connects to a cloud data source, `Power BI automatically creates a personal cloud connection and binds it to your semantic model`. This means that the connection details and credentials you used in Power BI Desktop are carried over to the Power BI service, allowing the report to continue accessing the cloud data source without any additional configuration.

> Personal Cloud Connections

| **Aspect**                | **Details**                                                                                                                                                                                                                   |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Automatic Creation**    | When you publish a .PBIX file from Power BI Desktop that connects to a cloud data source, a personal cloud connection is automatically created and bound to your semantic model. This means the connection details and credentials used in Power BI Desktop are carried over to the Power BI service, allowing the report to continue accessing the cloud data source without additional configuration. |
| **Limitations**           | Personal cloud connections are tied to the individual user who created them and cannot be shared with others. This can be limiting if multiple users need to access the same data source.                                                                            |

> Shareable Cloud Connections

| **Aspect**                | **Details**                                                                                                                                                                                                                   |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Advantages**            | Shareable cloud connections allow multiple connections to the same data source with different settings and can be shared with other users. This makes data management more collaborative and flexible.                                                               |
| **Manual Creation**       | Unlike personal cloud connections, shareable cloud connections need to be created manually in the Power BI service. You can create a new shareable cloud connection directly from the Semantic model settings page under Gateway and cloud connections. Select the shareable cloud connection you want to use and apply it. |

### Creating Shareable Connections

> You can create a new shareable cloud connection directly from the Semantic model settings page under Gateway and cloud connections. Select the shareable cloud connection you want to use and apply it.

> [!IMPORTANT]
> Security: If a data source contains `highly sensitive or confidential data`, set the privacy level to `Private`.

| Privacy level | Details |
| --- | --- |
| Private | Contains sensitive or confidential information, and the visibility of the data source may be restricted to authorized users. It is completely isolated from other data sources. Examples include Facebook data, a text file containing stock awards, or a workbook containing an employee review. |
| Organizational    | Limits the visibility of a data source to a trusted group of people. It is isolated from all Public data sources, but is visible to other Organizational data sources. A common example is a Microsoft Word document on an intranet SharePoint site with permissions enabled for a trusted group. |
| Public | Gives everyone visibility to the data. Only files, internet data sources, or workbook data can be marked Public. Examples include data from a Wikipedia page, or a local file containing data copied from a public web page.|

Steps:

- Go to [Power Bi](https://app.powerbi.com/)
- Click on ⚙️, and go to `Manage connections and gateways`

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/248c9c85-2a86-426e-b5dd-d30ec715c52c">

- Click on `+ New`, and choose the connection type, and fill required details.

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/48d66efa-91e2-4f07-8e27-26bb42f1d55b">

### Managing Connections

> - `Switching to Shareable Connections`: If you want to switch from a personal cloud connection to a shareable one, you can do so in the Semantic model settings. This allows you to leverage the benefits of shareable connections, such as easier management and sharing capabilities. <br/>
> - `Granular Access Control`: Power BI allows for granular access control at the tenant, workspace, and semantic model levels. This means you can enforce access policies to ensure that only authorized users can create or use specific connections.

- To assign the connection a semantic model, click on `...` over your semantic model, and go to `Settings`

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/69ab9537-9fed-4422-892e-f990dfaa0d57">

- Under `Semantic models`, search for `Gateway and cloud connections`. Assign you connection to the data source in the semantic model.

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/a38641f4-4139-429a-9f8e-81de965ddc0d">

- Another way go to that view og assign the connection, you can click on ⚙️, and go to `Power Bi Settings`. Search for your semantic models, and the `Gateway and cloud connections`:

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/549fd9e3-eed8-41cc-ad20-65887ae99838">

## Admin Monitoring Workspace

> Can help to identify which Power BI Premium Users are making use of the Cloud connections

The admin monitoring workspace in Microsoft Fabric is designed for `administrators to monitor and manage workloads, usage, and governance within their tenant`. It provides insights into user activity, content sharing, and capacity performance. The workspace is `automatically installed the first time an admin accesses it`. It includes `few reports and semantic models for detailed analysis`, helping administrators keep track of how resources are being used and ensuring compliance with governance policies.

Steps to setup admin monitoring workspace:

- Go to [Power Bi](https://app.powerbi.com/)
- Click on ⚙️, and go to `Admin portal`
- Under `Usage metrics`, and go to `Open admin monitoring workspace`
  
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/fcf3adfa-ff37-488d-8bb0-165a6aa87a6d">

> The report can be accessed from the Admin monitoring workspace and is designed for admins to analyze various usage scenarios.

| Report Name | Details |
| --- | --- |
| Feature Usage and Adoption Report | This report provides an in-depth analysis of how different features are utilized and adopted across your Microsoft Fabric tenant. It includes pages for activity overview, analysis, and detailed activity scenarios, helping identify which users are making use of cloud connections. |
| Purview Hub | Offers insights into data governance and compliance. It helps administrators manage and monitor data policies, ensuring that data usage aligns with organizational standards and regulatory requirements. |

<img width="550" alt="image" src="https://github.com/user-attachments/assets/7b40d8a6-bdf8-4a9c-b5dc-1772823c6c3e">

Some key limitations and considerations regarding reports in the admin monitoring workspace:

| **Category**               | **Details**                                                                                                                                                                                                                   |
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Non-Modifiable Reports** | - ``Fixed Reports``: Reports in the admin monitoring workspace are often pre-configured and cannot be modified. This means you cannot change the visuals, add new data fields, or customize the layout to fit specific needs.<br/>- ``Limited Customization``: The inability to modify these reports can be restrictive if you need to tailor the data presentation to specific audiences or requirements. |
| **Access and Permissions** | - ``Restricted Access``: Only users with appropriate permissions can view these reports. This can limit the ability of other team members to access and utilize the data.<br/>- ``Data Sensitivity``: Since these reports often contain sensitive administrative data, access controls are crucial to ensure data security and compliance. |

Benefits of sharing the semantic model:

| **Category**               | **Details**                                                                                                                                                                                                                   |
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Creating Custom Reports** | - ``Flexibility``: By sharing the semantic model, users can create their own reports using the same underlying data. This allows for greater flexibility in how data is visualized and analyzed.<br/>- ``Tailored Insights``: Users can customize reports to highlight specific metrics or insights that are most relevant to their needs. |
| **Collaboration**          | - ``Shared Understanding``: Sharing the semantic model promotes a shared understanding of the data across the organization. Different teams can collaborate more effectively by working with the same data definitions and structures.<br/>- ``Enhanced Data Utilization``: Multiple users can leverage the semantic model to create diverse reports, enhancing the overall utilization of the data. |
| **Consistency**            | - ``Standardized Data``: Using a shared semantic model ensures that all reports are based on the same data definitions and calculations, promoting consistency and accuracy in reporting.<br/>- ``Reduced Redundancy``: It reduces the need for multiple versions of the same data, minimizing redundancy and potential discrepancies. |

> [!IMPORTANT]
> Other ways to get insights: <br/>
>
> - `Monitoring Usage`: You can monitor and manage cloud connections through the Power BI service. By navigating to the Manage connections and gateways section, you can see which users have access to and are using specific cloud connections. <br/>
> <img width="550" alt="image" src="https://github.com/user-attachments/assets/d64e3acd-aef9-47ba-81c6-c0e92ae5518b"> <br/>
> - `Premium Capacity Metrics`: For a more detailed analysis, you can use the Premium Capacity Metrics app, which provides insights into the usage and performance of your Power BI Premium capacities.

## Identify Access per report

- Go to your workspace
- Click on `...`, and select `Manage permissions`

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/7a0d0a96-6519-4d84-bd56-5aa7c2497cea">
  
- You will see something like this:

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/11633c88-d19d-4e33-bf33-24c985afbb78">

## Restrict Access from new gateway connections

> Facilitate secure data transfer between Power BI or Power Apps and non-cloud data sources like on-premises SQL Server databases or SharePoint sites.

Gateway Roles:

| Role                         | Permissions                                                                                          |
|------------------------------|------------------------------------------------------------------------------------------------------|
| `Admin`                      | - Can manage and update the gateway.<br/>- Allowed to create connections (data sources) on the gateway.<br/>- Can manage (add/delete) users with admin, connection creator, and connection creator with sharing roles.<br/>- Manages access to all connections created on the gateway. |
| `Connection Creator`         | - Allowed to create connections/data sources on the gateway.<br/>- Can test the status of the gateway cluster and its members.<br/>- Cannot manage or update the gateway or add/remove users. |
| `Connection Creator with Sharing` | - Allowed to create connections/data sources on the gateway and test the gateway status.<br/>- Can share the gateway with other users as a connection creator but cannot remove users. |

Connection Roles:

| Role                         | Permissions                                                                                          |
|------------------------------|------------------------------------------------------------------------------------------------------|
| `Owner`                      | - Can update credentials and delete the connection.<br/>- Can assign others to the connection with Owner, User, or User with sharing permissions. |
| `User`                       | - Can use the connection in Power BI reports and dataflows.<br/>- Cannot see or update credentials. |
| `User with Sharing`          | - Can use the connection in Power BI reports and dataflows.<br/>- Can share the data source with others with User permission. |

Steps to Manage Gateway and Connection Roles:

- Go to [Power Bi/Fabric admin center](https://app.powerbi.com/)
- Click on ⚙️, and go to `Manage Connections and Gateways`
- Choose `Connections`, `On premises data gateway` or `Virtual Network data gateways`:

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/7c102a22-9040-4ba8-b17a-720c5dd88dd3">

- Click on `...`, and select `Manage users`:

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/9a548e80-f53e-42ad-8999-4ca54428e3da">

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/b445d8d0-0bf6-447a-9d2a-05067b028e17">

### On-premises Data Gateways

> On-premises data gateways facilitate secure data transfer between on-premises data sources and Power BI services. They are essential for scenarios `where data cannot be moved to the cloud due to compliance or security reasons`.

| **Category**                     | **Details**                                                                                                                                                                                                                                                                                                                                                       |
|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ``Restricting Gateway Installations`` | - ``Tenant-Level Control``: Restrict who can install on-premises data gateways at the tenant level through the Power Platform admin center. This prevents unauthorized users from creating new gateway connections.<br/>- ``Role Management``: Assign specific roles to users, such as Admin, Connection Creator, and Connection Creator with Sharing, to control who can create and manage connections on the gateway. |
| ``Security Measures``            | - ``Network Security Groups (NSGs)``: Configure NSGs to allow outbound traffic to necessary endpoints, such as Microsoft Entra ID for authentication and Certificate Authorities for HTTPS connections.<br/>- ``Private Links``: Use private links to secure connectivity from your network to Power BI, ensuring that data traffic does not traverse the public internet.                         |
| ``Managing Data Sources``        | - ``Data Source Configuration``: Configure data sources on the gateway and manage user access to these sources. Ensure that only authorized users can create and manage connections.                                                                                                                                                                               |
| ``Monitoring and Auditing``      | - ``Usage Monitoring``: Regularly monitor gateway usage to detect any unauthorized access or unusual activity.<br/>- ``Audit Logs``: Maintain audit logs to track changes and access to the gateways and data sources.                                                                                                                                               |

Steps to Restrict Access for On-Premises Data Gateways:

> - **Tenant-Level Control**: You can `restrict who can install on-premises data gateways at the tenant level through the Power Platform admin center`. This prevents unauthorized users from creating new gateway connections. <br/>
> - **Role Management**: Assign specific roles to users, such as Admin, Connection Creator, and Connection Creator with Sharing, `to control who can create and manage connections on the gateway`.

1. **Access the Power Platform Admin Center**: Go to the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/ext/DataGateways).
2. **Navigate to Data Gateways**:
   - Click on **Data** (preview) in the left-hand menu.
   - Select **On-premises data gateway**.
3. **Enable Tenant Administration for Gateways**: Turn on **Tenant administration for gateways**.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/d39c8a49-ef78-476f-ac9d-e53ae42a7247">

4. **Restrict Users from Installing Gateways**: Toggle on **Restrict users in your organization from installing gateways**.
5. **Allow Specific Users to Override the Restriction** (if needed): Add the users who are allowed to install gateways by specifying their details.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/92ccd161-22b5-47bb-9ab5-09eecb01396f">

### Virtual Network (VNet) Data Gateways

> Allow Power BI to connect to data services within an Azure virtual network without needing an on-premises data gateway. This setup is particularly useful for maintaining security and compliance by keeping data traffic within the Azure backbone.

| **Section**                   | **Details**                                                                                                                                                                                                                                                                                                                                 |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Licensing Requirements:**| VNet data gateways require a Power BI Premium capacity license (A4 SKU or higher or any P SKU).                                                                                                                                               |
| **Managing VNet Data Gateways:** | - **Admin Management:** You can manage VNet data gateways through the Power Platform admin center or the Manage Gateways page in Power BI.<br/>- **Data Source Management:** Create and share data sources within the VNet data gateway as you would with standard data gateways. |
| **Security and Connectivity:** | - **Private Endpoints:** Use private endpoints to connect securely to your data sources within Azure. This ensures that all traffic remains on the Azure backbone and is not exposed to the public internet.<br/>- **Conditional Access Policies:** VNet data gateways support conditional access policies, allowing you to enforce security measures based on user identity and location.<br/>- **Microsoft Entra ID SSO:** Enable single sign-on (SSO) for DirectQuery to ensure that queries execute under the user's Microsoft Entra ID identity. |
| **Restrictions and Limitations:** | - **Cross-Tenant Scenarios:** VNet data gateways must be created in the same tenant as the Power BI tenant.<br/>- **Region Constraints:** The virtual network data gateway is physically located in the same region as your Azure virtual network. |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1280-limegreen" alt="Total views">
  <p>Refresh Date: 2025-09-05</p>
</div>
<!-- END BADGE -->
