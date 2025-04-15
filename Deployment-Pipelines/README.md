# Deployment Pipelines - Demo \& Overview

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-01-29

------------------------------------------

> Lakehouse Schema and Deployment Pipelines 


<details>
<summary><b> List of References </b> (Click to expand)</summary>

- [Table deletes, updates, and merges - DeltaTables](https://docs.delta.io/latest/delta-update.html#-merge-in-streaming)
- [DeltaLake - DeltaTables Releases](https://github.com/delta-io/delta/releases)
- [DeltaTable execute() example](https://github.com/delta-io/delta/blob/master/examples/python/quickstart.py#L50-L56)
- [Create deployment rules](https://learn.microsoft.com/en-us/fabric/cicd/deployment-pipelines/create-rules?tabs=new)
- [Notebook source control and deployment](https://learn.microsoft.com/en-us/fabric/data-engineering/notebook-source-control-deployment)
- [Fabric: Understand the deployment process](https://learn.microsoft.com/en-us/fabric/cicd/deployment-pipelines/understand-the-deployment-process)
- [Incremental refresh in Dataflow Gen2 - Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-factory/dataflow-gen2-incremental-refresh)
- [Dataflow Gen2 refresh - Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/data-factory/dataflow-gen2-refresh)
- [Announcing Public Preview: Incremental Refresh in Dataflow Gen2](https://blog.fabric.microsoft.com/en-us/blog/announcing-public-preview-incremental-refresh-in-dataflows-gen2/)
- [Choose the best Fabric CI/CD workflow option for you](https://learn.microsoft.com/en-us/fabric/cicd/manage-deployment)

</details>

<details>
<summary><b>Table of Contents</b> (Click to expand)</summary>

- [Overview](#overview)
- [Demo](#demo)
    - [Create a Workspace](#create-a-workspace)
    - [Create a Lakehouse](#create-a-lakehouse)
    - [Create a New Semantic Model](#create-a-new-semantic-model)
    - [Auto-Generate Report with Copilot](#auto-generate-report-with-copilot)
    - [Create a Deployment Pipeline](#create-a-deployment-pipeline)
    - [Deploy to Production](#deploy-to-production)
- [How to refresh the data](#how-to-refresh-the-data)


</details>

## Overview

> [!Note]
> `Ownership and Deployment`: In Microsoft Fabric, only the owner of an artifact can deploy it. Non-owner admins do not have the permissions to deploy artifacts. You can create a service principal to act like an owner, allowing it to deploy artifacts on behalf of the actual owner. This ensures that deployment tasks can be automated and managed efficiently without compromising security. <br/> <br/>
> `Deployment Rules for Notebooks and Pipelines`: You can add `deployment rules` for notebooks and pipelines in Microsoft Fabric. Deployment rules `can be configured to manage different stages (development, test, production)` and to change content settings during deployment. For notebooks, you can set rules to specify the default lakehouse, which helps avoid manual changes to source and destination references post-deployment.

Process Overview:

1. **Pipeline Structure**: You define the deployment pipeline structure, which typically includes stages like development, test, and production. Each stage can have its own workspace.
2. **Adding Content**: Content can be added to a pipeline stage by assigning a workspace or deploying content from one stage to another. When you deploy content, Microsoft Fabric copies the metadata, reports, dashboards, and semantic models to the target stage.
3. **Content Cloning**: During deployment, the content from the source stage is cloned to the target stage. This includes the structure and semantic models but `not the actual data` within the tables. This means that while the structure and connections are maintained, the data itself needs to be refreshed or reloaded in the new stage.
4. **Autobinding**: Microsoft Fabric tries to maintain connections between items during deployment. For example, if a report is connected to a semantic model, this connection is preserved in the target stage.

> [!IMPORTANT]
> `Specifics for Lakehouse:` For lakehouses, the deployment process typically `includes the structure and metadata but not the actual data tables`. This is why you might see the structure and semantic models deployed, but the tables themselves need to be manually refreshed or reloaded in the target environment.<br/> <br/>
> `Deployment Rules:` You can set deployment rules to manage different stages and change content settings during deployment. For example, you can specify default lakehouses for notebooks to avoid manual changes post-deployment.

## Demo 

<div align="center">
  <img src="https://github.com/user-attachments/assets/46045fa8-34e8-4fff-a343-d49f36eece89" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 2px; padding: 2px; width: 500px; height: auto;"/>
</div>
    
### Create a Workspace

1. Navigate to the Microsoft Fabric portal.
2. Click on `Create a new workspace`.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/58069226-12c5-43ca-9c0f-4f95d6d2a556" />

3. Name your workspace (e.g., `Analytics Dev`).

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/97bf47a4-00d8-4acc-af85-2fc52793a8f5" />

4. Ensure that your workspace is allocated to the appropriate Fabric Capacity:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/0cf11e09-dbc1-470a-9a77-6dbc279a5242" />

5. You can repeat this same process to create the production environment. You may host your workspace in the same capacity or in a different Fabric Capacity. Name your workspace (e.g., `Analytics Prod`).

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/1ba0f05c-1900-46e1-b4cc-3e0acb9fdd6a" />

    | Dev Workspace | Prod Workspace |
    | --- | --- |
    |       <img width="550" alt="image" src="https://github.com/user-attachments/assets/0cf11e09-dbc1-470a-9a77-6dbc279a5242" /> | <img width="550" alt="image" src="https://github.com/user-attachments/assets/927fc744-940d-4074-9576-1246f33c4f25" /> |

### Create a Lakehouse

1. Within your new workspace, select `New item` and choose `Lakehouse`.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/c391ccc3-408a-4a38-979c-acbe2fc65818" />

2. Name your lakehouse (e.g., `Sales_Data_Lakehouse`).

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/a69d3f63-4286-4368-8515-d0383b63b09c" />

3. Click on `Get data`, and `Upload files`:

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/e3dd716c-7391-4a03-9ff2-4f8722fd29bf" />

4. Load data into the tables:

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/a28a5540-106e-4fa2-b515-88831fa96b8d" />

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/b543a1c8-6686-484e-a9a9-f372c53262f0" />

5. The information loaded will be under Tables/dbo section, if you are using the lakehouse schema:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/0b3da49f-2738-412a-8b9d-bb0f2433d181" />

### Create a New Semantic Model

1. Use the `New semantic model` option to create a Power BI semantic model.
2. Select specific tables and views from your lakehouse.
3. Save the semantic model to your workspace for sharing, data modeling, and reporting.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/25bda38f-41fa-45f9-aa01-e647d9f4bd84" />

4. At this point, you should see something similar like following: 

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/e1f88782-ddc6-4fb8-947a-af23b92a8415" />


### Auto-Generate Report with Copilot

> [!NOTE]
> Ensure you have the necessary permissions and settings enabled for Copilot to access and use your data.

1. Use Copilot to create a report based on your dataset. In your workspace, click on `...` over your semantic model and select `Auto-create report`:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/19718d27-7385-45a8-8aeb-2a6409490c61">

2. The outcome will depend on the information you provide in this case. Copilot automatically generated this report for me; you can continue editing:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/9f4bdd42-8ac5-43ea-9af9-32828b59b4a7" />

3. Remember to click on `Save`:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/097a90e0-e131-4205-ad9c-241e34b0206b" />

### Create a Deployment Pipeline

1. Go back to the Microsoft Fabric portal and select `Deployment Pipelines`.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/507fe86a-8710-407e-ae31-5597371b9945" />

2. Create a new pipeline and name it (e.g., `Dev to Prod Pipeline`).

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/52681609-c66d-445c-a387-ff1989f0bf53" />

3. You can customize your stages. For this case, we will only have a development workspace and a production workspace:
  
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/1836520a-7b70-4a12-a8af-5a78e29c95ab" />

4. Add your `Analytics Dev` workspace as the source, click on `Assign a workspace`:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/df0291f4-84a0-46f3-83aa-3dc6aa99ef07" />

5. Add the `Production Workspace` as the target.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/082614ba-4d9a-4a2a-a0c2-a3287366ee75" />

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/bf39af09-2fda-4d49-958b-d68b87a300c6" />

### Deploy to Production

1. Use the deployment pipeline to move your lakehouse, dataset, and report from the `Analytics Dev` to the `Analytics Prod` workspace.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/0492b8a4-3d7c-4d27-9bfc-a4996e6f3c3e" />

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/f99211f2-a60c-414d-a1a0-9135c2fd5879" />

2. Verify that everything is working correctly in the production environment.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/46045fa8-34e8-4fff-a343-d49f36eece89" />

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/fc139a2c-3f59-4534-8378-55fe929d33b2" />

## How to refresh the data

> To ensure that data is refreshed and reloaded in the new stage of your deployment in Microsoft Fabric, you can use the following methods:

| **Type of Refresh**       | **Description**                                                                                                                                                                                                                     | **Details**                                                                                                                                                                                                                       |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Scheduled Refresh**     | Automatically refreshes data at specified intervals to keep it up-to-date. This allows you to automatically refresh the data at specified intervals, ensuring that the data in the new stage is always up-to-date.                                                                                                                                                          | - Can be configured to run multiple times a day.<br>- Ensures data in the new stage is always current.                                                                                                                             |
| **On-Demand Refresh**     | Allows immediate data refresh, triggered manually or programmatically.                                                                                                                                                              | - Can be done through workspace list or lineage views.<br>- Can be triggered via a pipeline containing a dataflow activity.                                                                                                        |
| **Incremental Refresh**   | Refreshes only the data that has changed since the last refresh, improving efficiency. Click [here to understand more about incremental refresh](https://github.com/brown9804/MicrosoftCloudEssentialsHub/blob/main/0_Azure/2_AzureAnalytics/0_Fabric/demos/11_PBi_IncreRefresh.md)                                                                                                                                       | - **Evaluate Changes**: Checks for changes in the data source based on a DateTime column.<br>- **Retrieve Data**: Only changed data is retrieved and loaded.<br>- **Replace Data**: Updated data is processed and replaced.       |

Steps to Set Up Incremental Refresh:
1. **Create or Open a Dataflow**: Start by creating a new Dataflow Gen2 or opening an existing one.
2. **Configure the Query**: Ensure your query includes a DateTime column that can be used to filter the data.
3. **Enable Incremental Refresh**: Right-click the query and select Incremental Refresh. Configure the settings, such as the DateTime column and the time range for data extraction.
4. **Publish the Dataflow**: Once configured, publish the dataflow. The dataflow will then automatically refresh the data incrementally based on the settings.

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
