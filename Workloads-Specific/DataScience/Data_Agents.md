# Demonstration: Data Agents in Microsoft Fabric (Preview)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-02

----------

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Fabric data agent concepts (preview)](https://learn.microsoft.com/en-us/fabric/data-science/concept-data-agent)
- [How to create a Fabric data agent (preview)](https://learn.microsoft.com/en-us/fabric/data-science/how-to-create-data-agent)
- [Fabric data agent example with the AdventureWorks dataset (preview)](https://learn.microsoft.com/en-us/fabric/data-science/data-agent-scenario): `This example sets up a Fabric data agent to enable conversational AI over enterprise data`. It connects to a lakehouse with the AdventureWorks dataset and allows users to ask natural language questions. The agent interprets queries, accesses data from sources like warehouses, semantic models, and KQL databases, and returns insights. It simplifies data interaction without requiring code or SQL.
- [Create a Fabric data agent (preview)](https://learn.microsoft.com/en-us/fabric/data-science/how-to-create-data-agent)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Setup required](#setup-required)
- [How it works](#how-it-works)
- [Examples of what to ask](#examples-of-what-to-ask)

</details>

> AI skills in Microsoft Fabric enable users to `create conversational AI experiences that answer questions about data stored
> in lakehouses, warehouses, Power BI semantic models, and KQL databases`. These skills make data insights accessible and
> actionable, allowing users to `interact with data naturally and receive relevant answers without needing technical expertise`.
> You can create custom Q&A systems using generative AI, guiding the AI with instructions and examples to ensure it understands your organization's context and data.

Key Features:

- Customizable Q&A Systems: Tailor the AI to answer specific questions relevant to your organization.
- Generative AI: Leverage advanced AI to interact with your data, enhancing data-driven decision-making.
- Ease of Use: Once set up, users can simply ask questions and get accurate answers without needing deep technical knowledge.

## Setup required

1. Please ensure you read all the [prerequisites](https://learn.microsoft.com/en-us/fabric/data-science/how-to-create-data-agent#prerequisites)
2. **Tenant switch enabled**: These features must be activated as mentioned here [prerequisites](https://learn.microsoft.com/en-us/fabric/data-science/how-to-create-data-agent#prerequisites)
 
    <https://github.com/user-attachments/assets/f0df6fb9-e139-4c97-9b68-a6ea05eb6584>

3. **F2 Fabric capacity or higher**: Ensure you have the appropriate Fabric capacity.
4. **Workspace configured with Fabric Capacity**:

    <img width="200" height="300" alt="image" src="https://github.com/user-attachments/assets/7fbfb16d-a32a-4540-bd03-e6b3c0412a5b">

    <img width="700" height="300" alt="image" src="https://github.com/user-attachments/assets/1cb31d49-6138-4c95-835a-a61ccb08661b">

5. At least one of these: A warehouse, a lakehouse, one or more Power BI semantic models, or a KQL database with data.

## How it works

1. Go to the `workspace`, click on `+ New item`, search for `Data agent`, and select it.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/42ff0a1c-3e61-4e24-8bb5-e56db6fe9b7e" />

2. Choose the name for the Data agent instance:
   
     <https://github.com/user-attachments/assets/752734e4-f7f6-44a3-8ccb-069ac005a410>

3. Add data:
   
     <https://github.com/user-attachments/assets/9800e74e-cbca-45ff-a712-bb2e8a095bb5>

4. Relate tables, and start asking!

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/77d5ddbe-8230-440d-9617-d937da48b3cd" />

## Examples of what to ask 

| **Question**                                                                 | **Example of it looks**                                                                                       |
|------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| **Data Exploration**                                                         |                                                                                                               |
| - Can you provide an overview of this dataset?  <br/> - Are there any missing values or anomalies in this dataset?                               |            <img width="500" alt="image" src="https://github.com/user-attachments/assets/2a43117e-3b29-46f8-98b7-f097df425429">                                                                                                    |
|  What are the key variables in this data?                                   |       <img width="500" alt="image" src="https://github.com/user-attachments/assets/621c6237-7c79-4c67-981a-e9d7afccf29f">                    |
| **Data Insights**                                                            |                                                                                                               |
| What patterns or trends can you identify in this data?                     |<img width="500" alt="image" src="https://github.com/user-attachments/assets/899653c3-fa41-4834-8606-37759a7f1ad6">               |
| Can you highlight any correlations between variables?                      | <img width="500" alt="image" src="https://github.com/user-attachments/assets/a9442f38-ade1-45ee-9cb6-4adf8bdbf0f7">              |
| What are the outliers in this dataset?                                     | <img width="500" alt="image" src="https://github.com/user-attachments/assets/1c0d07b2-91fe-4335-9760-886c10e77bb9">                 |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-659-limegreen" alt="Total views">
  <p>Refresh Date: 2025-07-22</p>
</div>
<!-- END BADGE -->
