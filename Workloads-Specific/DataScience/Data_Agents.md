# Demostration: Data Agents in Microsoft Fabric (Preview)

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

1. **F64 Fabric capacity or higher**: Ensure you have the appropriate Fabric capacity.
2. **Workspace configured with Fabric Capacity**:

    <img width="200" height="300" alt="image" src="https://github.com/user-attachments/assets/7fbfb16d-a32a-4540-bd03-e6b3c0412a5b">

    <img width="700" height="300" alt="image" src="https://github.com/user-attachments/assets/1cb31d49-6138-4c95-835a-a61ccb08661b">

3. **Tenant switch enabled**: This feature must be activated.
    - Enable tenant configuration for AI Skills:
    
      <img width="700" alt="image" src="https://github.com/user-attachments/assets/5930167b-39f1-4165-8876-3cac3bf52780">
    
    - Enable tenant configuration for Copilot and AI:
    
      <img width="700" alt="image" src="https://github.com/user-attachments/assets/e0aa19e9-e525-4c45-919a-3f6aeaa12b41">

4. **Cross-Geo sharing for AI enabled**: If relevant to your setup, this should be enabled.
5. **A Warehouse or Lakehouse with data**: You need to have data available in either a Warehouse or Lakehouse.

## How it works

1. Go to Data Science space:
   
    <img width="500" alt="image" src="https://github.com/user-attachments/assets/a8624ffd-314b-45f4-b8d0-c260655b3003">

2. Choose the name for the AI Skill instance:
   
    <img width="500" alt="image" src="https://github.com/user-attachments/assets/61b52cea-9124-4f51-9be6-d40b0e426b15">

3. Add data:
   
    <img width="500" alt="image" src="https://github.com/user-attachments/assets/d3d85411-f18a-4ad4-8c24-919a35d4239a">

4. If new, choose the source/connection:

    <img width="500" alt="image" src="https://github.com/user-attachments/assets/f82beaf6-708f-45ed-9388-787f74cb23af">

5. Relate tables, and start asking!

    <img width="500" alt="image" src="https://github.com/user-attachments/assets/bd105edc-6011-4cb9-bae7-f587486e0819">

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

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
