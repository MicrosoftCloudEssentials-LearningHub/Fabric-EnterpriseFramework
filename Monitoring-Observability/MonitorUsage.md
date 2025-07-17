# Microsoft Fabric Monitoring Usage - Overview

Costa Rica

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com)
[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-21

----------

> [!NOTE]
> Ensure you have admin rights for the capacity you want to monitor.

<details>
<summary><b>List of References</b> (Click to expand)</summary>

- [Install the Microsoft Fabric capacity metrics app](https://learn.microsoft.com/en-us/fabric/enterprise/metrics-app-install?tabs=1st)
- [What is the Microsoft Fabric Capacity Metrics app?](https://learn.microsoft.com/en-us/fabric/enterprise/metrics-app)
- [Understand the metrics app compute page](https://learn.microsoft.com/en-us/fabric/enterprise/metrics-app-compute-page)
- [What is the admin monitoring workspace? (Preview)](https://learn.microsoft.com/en-us/fabric/admin/monitoring-workspace)
- [Feature usage and adoption report (preview)](https://learn.microsoft.com/en-us/fabric/admin/feature-usage-adoption)
- [Use the Monitor hub](https://learn.microsoft.com/en-us/fabric/admin/monitoring-hub)
- [Monitoring Hub github repo ref](https://github.com/MicrosoftDocs/fabric-docs/blob/main/docs/admin/monitoring-hub.md)
- [Manage audit log retention policies](https://learn.microsoft.com/en-us/purview/audit-log-retention-policies?tabs=microsoft-purview-portal)

</details>

## Content

- [Microsoft Fabric Capacity Metrics app](#microsoft-fabric-capacity-metrics-app)
  - [Installation Steps](#installation-steps)
  - [Configuration Steps](#configuration-steps)
  - [Troubleshooting](#troubleshooting)
- [Admin monitoring](#admin-monitoring)
  - [Configure the Admin Monitoring Workspace](#configure-the-admin-monitoring-workspace)
  - [How to Use Data from Admin Monitoring Workspace Custom Reports](#how-to-use-data-from-admin-monitoring-workspace-custom-reports)
- [Monitor Hub](#monitor-hub)
  - [How to Access and Use the Monitor Hub](#how-to-access-and-use-the-monitor-hub)
  - [Extending Activity History](#extending-activity-history)

## Microsoft Fabric Capacity Metrics app

> The `Microsoft Fabric Capacity Metrics app` is designed to provide comprehensive monitoring capabilities for Microsoft Fabric capacities. It helps administrators track capacity consumption, identify performance bottlenecks, and make informed decisions about scaling and resource allocation. The app provides detailed insights into capacity utilization, throttling, and system events, enabling proactive management of resources to ensure optimal performance. <br/> <br/>
> This app is essential for maintaining the health and efficiency of your Microsoft Fabric capacities

| **Feature**                  | **Description**                                                                 |
|------------------------------|---------------------------------------------------------------------------------|
| **Capacity Utilization**     | Monitors the usage of Capacity Units (CUs) over time, distinguishing between interactive and background operations. |
| **Throttling**               | Displays delays and rejections based on capacity consumption, helping to manage and mitigate performance issues. |
| **System Events**            | Logs significant events such as capacity pauses and resumes, providing context for performance changes. |
| **Matrix by Item and Operation** | Breaks down metrics by individual items and operations, offering granular insights into resource usage. |

### Installation Steps

1. **Get the App**:
    - Navigate to [Microsoft Fabric](https://app.fabric.microsoft.com/). In the left panel, locate the `Apps` icon and click on `Get apps`.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/931eb614-bb29-4e03-9637-4a9ef0cc3e7a">

     - Search for `Microsoft Fabric Capacity Metrics`:

          <img width="550" alt="image" src="https://github.com/user-attachments/assets/a743d770-f1ea-474b-8d2c-c363e2a40e13">

     - Select `Get it now`:

          <img width="550" alt="image" src="https://github.com/user-attachments/assets/93412866-bf62-4c09-a62c-4bda280d7a40">

     - Click on `Install`:

          <img width="550" alt="image" src="https://github.com/user-attachments/assets/49aa432b-a3fd-4a2d-a504-ce08841b681e">

### Configuration Steps

1. **Run the App for the First Time**:
   - In Microsoft Fabric, go to **Apps** and select the Microsoft Fabric Capacity Metrics app.
   - When prompted with `You have to connect to your own data to view this report`, select **Connect**.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/de72c2c8-f755-41be-831d-9b756963a30b">

2. **Connect to Your Data**:
   - In the first connection window, fill in the required fields:
     - **CapacityID**: Find this in the URL of the capacity management page (e.g., `9B77CC50-E537-40E4-99B9-2B356347E584`).
          1. Navigate to the Capacity Management Page:
             - Go to the Power BI service and sign in with your admin account.
             - Click on the `Settings` gear icon in the top right corner.
             - Select `Admin Portal` from the dropdown menu.

                 <img width="550" alt="image" src="https://github.com/user-attachments/assets/5b3a8f2a-8062-4a2f-b121-96522088c2d7">

          2. Access Capacity Settings:
             - In the Admin Portal, go to the `Capacity settings` section.
             - Select the capacity you want to monitor.

                 <img width="550" alt="image" src="https://github.com/user-attachments/assets/64e75e78-9a33-44fc-b50a-1e041583626e">

          3. Locate the CapacityID:
             - Look at the URL in your browser’s address bar. The CapacityID is part of this URL.
             - It will look something like this: `https://app.powerbi.com/admin-portal/capacities/9B77CC50-E537-40E4-99B9-2B356347E584`.
             - The string `9B77CC50-E537-40E4-99B9-2B356347E584` is your CapacityID.

                 <img width="550" alt="image" src="https://github.com/user-attachments/assets/8b028365-bf3d-4dfd-a40e-95f355c27ff4">

     - **UTC_offset**: Enter your organization's standard time in UTC (e.g., for Central Standard Time, enter `-6`).

         <img width="550" alt="image" src="https://github.com/user-attachments/assets/b2f5e435-d3a0-4e2b-ae80-0376caa2e00b">

         <img width="550" alt="image" src="https://github.com/user-attachments/assets/91bffe08-d600-461f-9d44-f4b35265d662">

3. **Advanced Options** (Optional): You can disable automatic data refresh by expanding the advanced options and selecting **Off** (`On` status is recommended). Click `Next`:

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/992a978c-a4af-485e-9efa-738bc261098a">

4. **Authentication and Privacy**: In the second connection window, select your **Authentication method** (default is OAuth2).

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/f1d1742b-1352-4e8f-b840-1aeafc987961">

5. **Sign In and Continue**:
   - Sign in and select a capacity from the **Capacity Name** dropdown.
   - The app may take a few minutes to load your data. If it doesn't display data immediately, refresh the app.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/35bd1fc0-e5b3-43f0-acf8-d71310134273">

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/be675f2f-82a4-4799-a72b-04cc9b47f3aa">

### Troubleshooting

- If the app doesn't show data or can't refresh, try deleting the old app and reinstalling the latest version.
- Update the semantic model credentials if needed.

## Admin monitoring

> `Admin monitoring workspace` in Microsoft Fabric is a powerful tool for administrators to track and analyze usage metrics across their organization. This workspace provides detailed insights into how different features and services are being utilized, helping admins make informed decisions to optimize performance and resource allocation.

Key Components:

| **Item**                          | **Description**                                                                 |
|-----------------------------------|---------------------------------------------------------------------------------|
| **Feature Usage and Adoption - Report** | Provides detailed reports on the adoption and usage of various features within the organization. |
| **Feature Usage and Adoption - Semantic model** | Contains the underlying data model that supports the usage and adoption reports. |
| **Purview Hub - Semantic model**  | Includes data models related to data governance and compliance monitoring.      |
| **Purview Hub - Report**          | Offers reports on data governance and compliance, helping to ensure adherence to relevant regulations and standards. |

Benefits of Using Admin Monitoring Workspace:

1. **Track Feature Adoption**: Understand which features are being used the most and identify areas where additional training or resources might be needed.
2. **Monitor Performance**: Keep an eye on system performance and identify any bottlenecks or issues that need to be addressed.
3. **Optimize Resources**: Make data-driven decisions about scaling and resource allocation to ensure optimal performance.
4. **Ensure Compliance**: Use the Purview Hub to monitor data governance and compliance, ensuring that your organization adheres to relevant regulations and standards.

### Configure the Admin Monitoring Workspace

> [!IMPORTANT]
>
> - **Permissions**: `Only users with direct admin roles can set up the Admin Monitoring workspace`. If the admin role `is assigned through a group, data refreshes may fail`. <br/>
> - **Read-Only Workspace**: The `Admin Monitoring workspace is read-only`. Users, including admins, cannot edit or view properties of items such as semantic models and reports within the workspace. `Admins can share reports and semantic models within the workspace with other users by assigning them a workspace viewer role or providing direct access links.`
> - **Reinitializing the Workspace**: If needed, `you can reinitialize the workspace by executing an API call to delete the semantic model and then reinstalling the workspace`.

1. **Log into Microsoft Fabric**: Sign in to the [Microsoft Fabric service](https://app.fabric.microsoft.com/) with your admin credentials.
2. **Access the Admin Portal**:
   - Click on the **Settings** gear icon in the top right corner.
   - Select **Admin Portal** from the dropdown menu.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/642655d2-54c6-40ff-8060-7ed533e6ad57">

3. **Navigate to the Admin Monitoring Workspace**:
   - In the Admin Portal, you will see a message about the new monitoring and metrics experience under `Usage Metrics`:
   - Click on the **Open admin monitoring workspace** link provided in the message.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/573e6ccc-ac22-4ed4-9520-5f132400b9c8">

4. **Install the Workspace**:
   - If this is your first time accessing the Admin Monitoring workspace, it will automatically begin the installation process.
   - Wait a few minutes for the installation to complete. The initial data refresh will start around five minutes after installation and usually completes within a few minutes.

5. **Configure Data Refresh**:
   - The semantic models in the workspace are automatically refreshed once per day.
   - Ensure that the admin who first accessed the workspace remains an admin to maintain the scheduled refresh process.

6. **Reassign Workspace (Optional)**:
   - To take advantage of capacity benefits such as unlimited content sharing, you can reassign the workspace to a different license mode:
     - Navigate to the **Workspaces** page in the Admin Portal.
     - Select the **Actions** button next to the Admin Monitoring workspace.
     - Choose **Reassign workspace** and select the desired license mode, then click **Save**.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/6c36eb69-0b3e-4eef-b9ab-b4e507ad9ab9">

### How to Use Data from Admin Monitoring Workspace (Custom Reports)

1. **Connect to Semantic Models**:

    - In your new workspace, click on `+ New item`, search for `report`, and select it.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/7e078c82-936e-421f-b0d2-c1264143409c">

   - Click on `Pick a published semantic model`:

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/f711aec8-5da3-4f38-ad6e-d552a81cb912">

   - Search for and connect to the semantic models from the Admin Monitoring workspace.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/827780f4-193a-4c04-82ae-0edaa7c0312b">

2. **Create Custom Reports**: You can utilize copilot capabilities to automatically create your report and edit it. Request additional pages with your content or even ask questions about your data.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/12368a38-cd80-4bdb-b249-efb2b9225260">

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/c928cae7-4bb3-48b9-8bf9-7f05f2f0b7e2">

3. **Share Reports**: Once your reports are created, you can share them with others by assigning roles or providing direct access links.

> Admins can share reports and semantic models within the workspace with other users by assigning them a workspace viewer role or providing direct access links.

| Semantic model access | Workspace access |
| --- | --- |
| <img width="550" alt="image" src="https://github.com/user-attachments/assets/a35a7168-a84c-43c1-9aa9-8e81c93b92fc"> | <img width="550" alt="image" src="https://github.com/user-attachments/assets/b4e3eb6a-be98-4194-8800-7702d72b27a9"> |

## Monitor Hub

> Centralized tool that allows `users to view and track the status of activities across all workspaces for which they have permissions`. This hub provides a comprehensive overview of various `activities, such as dataset refreshes, Spark job runs, dataflows, datamarts, lakehouses, notebooks, semantic models, report views, etc`.

| **Feature**             | **Description**                                                                 |
|-------------------------|---------------------------------------------------------------------------------|
| **Activity Tracking**   | Displays activities for all Fabric items you have permission to view, sorted by start time with the newest activities at the top. |
| **Historical View**     | Keeps a history of activities for up to 30 days, allowing you to view past activities using the Historical runs option. |
| **Customizable Display**| Allows you to change the display order, configure table columns, and use keyword search and filters to find specific activities. |
| **Status and Details**  | Provides detailed status information for each activity, including the ability to view more details and take actions if you have the right permissions. |
| **Filter Options**      | You can filter activities by status, start time, item type, submitted by, and location to narrow down the results. |

### How to Access and Use the Monitor Hub

1. **Open the Monitor Hub**: In [Microsoft Fabric](https://app.fabric.microsoft.com/), select **Monitor** from the navigation pane. If you don't see it click on `...`:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/baf7123f-e8f7-4b2a-a437-66d95c829697">

2. **View Activities**: The monitor hub displays activities in a table format. You can sort the table by selecting column titles and use the Column options button to customize the display.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/0891e96c-d0c7-4e71-84e7-d1f91a4b6afc">

> For example:

<https://github.com/user-attachments/assets/0f7fecfb-0b04-422b-abca-fcbe8827e2a2>

3. **Search and Filter**:
   - Use the keyword search box to find specific activities.
   - Apply filters to narrow down the results based on status, time period, item type, owner, and workspace location.

        | Column Options | Filter Options |
        | --- | --- |
        | <img width="550" alt="image" src="https://github.com/user-attachments/assets/67c12153-1ddc-40e3-8c82-1514f3afc6a8"> | <img width="550" alt="image" src="https://github.com/user-attachments/assets/3dfcdc57-fd54-42f2-8e3c-9694fa7dca88"> |

5. **Take Actions**: If you have the necessary permissions, you can perform actions on activities by selecting the More options (...) next to the activity name.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/e8e3e3e9-a8b0-4527-8ecd-b01fc88f7392">

6. **View Historical Runs**: To view the history of a specific item, select Historical runs from the More options menu next to the activity name.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/5317042a-eae6-41e8-81dd-0e9901e87bb9">

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/0047d793-4a2d-43cf-ad78-fc5debbabe95">

### Extending Activity History

> To extend your activity tracking beyond 30 day, you can use `Microsoft Purview`: <br/>
>
> - Provides extended audit log retention up to 1 year with appropriate licensing. <br>
> - Use the Purview portal to view and export detailed activity logs. <br>
> - Utilize the Purview REST API to access scan history beyond 30 days.

Steps to  Access Microsoft Purview via Audit Logs:

1. **Navigate to the Admin Portal**:
   - Go to the [Microsoft Fabric](https://app.fabric.microsoft.com/) and sign in with your admin account.
   - Click on the **Settings** gear icon and select **Admin Portal**.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/4b5fb5d1-05f0-4e1a-9ec8-c32f569f1dd2">

2. **Access Audit Logs**:
   - In the Admin Portal, go to the **Audit logs** section.
   - Click on `Go to Microsoft 365 Admin Center`:

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/82cb3cd0-604f-4090-9dc5-0c86f1c29e2b">

    - You will see a message about the retirement of the site, which is being replaced with Microsoft Purview:

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/6fe2fc5e-9db1-47f7-bfd8-dd85694e49c8">

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/90730142-2a56-43af-a6e5-6c3aa5deddff">

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-63-limegreen" alt="Total views">
  <p>Refresh Date: 2025-07-17</p>
</div>
<!-- END BADGE -->
