# Demostration: How to Configure Workspace App

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-21

------------------------------------------

> How to create a Power Bi Workspace App from the beginning and share it with external users. The same steps apply to security groups; simply replicate the process for a security group and add members to it.

1. Create your Fabric Capacity

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/8f259cac-1dcb-4129-9070-0b31899c4ab4">

2. Go to [Fabric](https://app.fabric.microsoft.com/), and assign the capacity created to the workspace desired.

    <img width="248" alt="image" src="https://github.com/user-attachments/assets/f9847839-9827-4ba4-8ca8-0f71a6229acc"> <br/>

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/a93b9b06-e887-45f2-a621-29ebab58f845"> <br/>

    > Select the `large semantic model only if your model exceeds 10 GB`. If not, use the small model. The large setup is for models up to 10 GB.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/0b540105-e554-4056-b06c-cd3babc873e9">

3. Create a lakehouse to store your data:

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/07aa957b-48f0-4114-926a-d6004d96f93c">

4. Get your data, in this case a CSV file will be used

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/d2949bee-f968-48d6-9c23-13984fde3311">

5. After uploading the information, create the tables or upload the information to your existing tables:

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/664eeb04-7d09-4e7f-bd92-22e954ef689d">

6. Create a semantic model based on your tables:

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/f892506e-46a5-42bd-ba2f-585601e5a7a1">

7. Now you are able to create a report based on the semantic model created, you can ask copilot to create a draft report with the `Auto-create report` option.

> [!NOTE]
> Make sure to activate the setting under `Admin Portal -> Tenant Settings -> Copilot/Data -> Enabled`.  [Click here for more details](https://github.com/brown9804/MicrosoftCloudEssentialsHub/blob/main/0_Azure/2_AzureAnalytics/0_Fabric/demos/6_PBiCopilot.md#tenant-configuration)

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/aa306dcc-0bbd-4fdb-bb5f-04ef79e9dfc8">

- You will see something like this:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/c3101f92-d6cf-4df0-aabd-c0e0951994eb">

    <img width="955" alt="image" src="https://github.com/user-attachments/assets/99ec33b0-33c8-4fbc-93fb-8c8285ba5fae">

- You can leverage copilot to modify your report:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/1d46a462-252a-44bc-9d6b-420816878546">

- Once you are ready, save your report:
  
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/0d663e5a-2a8f-4e74-83d9-21e6bc4801ad">

- At this point you will have your `lakehouse`, with your `SQL analytics endpoint`, the `semantic model` and `the report`.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/180304fa-2bd5-4de4-9ef1-b4e290ce2929">

8. A paginated report, can also be created:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/ccccd176-dd0e-48cc-b6b8-1a7bab1e0a90">

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/26ec846b-3527-4328-9af0-6e17c60a256c">

9. Create an App, and assign the required audience:

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/c575a4e3-d7bd-4eb6-b61f-ee8345ec5c68">

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/c68d60de-801a-4d9c-98aa-a66d0cfa9dc6">

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/e2f45540-1b89-46bb-82a2-997c36bb5351">

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/057aa31e-7818-40f5-ac60-5f12425380c1">

> [!IMPORTANT]
> If you encounter these errors, it's necessary to grant the appropriate `(semantic model, sql analytics endpoint, and the app` permissions for access.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/7361815f-7a53-4ae7-80f9-5bd6e3033b59">

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/05fac487-647a-48c2-b2b9-d9f1f0b172ea">

- Let's say you want only `viewer` permissions:

     1. Need to give access to the lakehouse/sql analytics endpoint:

        <img width="436" alt="image" src="https://github.com/user-attachments/assets/814f831f-19b8-4939-a3e2-618385c4827b">

        > `Read All SQL Endpoint Data` permission allows users to access and read data from SQL endpoints within the Fabric environment. This permission is typically required for users who need to: <br/>
        > - Query Data: Execute SQL `queries against the data stored in the Fabric environment`. <br/>
        > - Access Reports: `View and interact with reports and dashboards that rely on SQL data sources`. <br/>
        > - Data Analysis: `Perform data analysis and generate insights` using SQL-based data.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/b87137f1-b464-43df-a04d-593a41b3131a">

  2. Make sure the person already have access to the semantic model:

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/f5344f85-53f3-48dc-b0b1-6b3c5995bbd6">

> - Granting `Read, ReadData` access to the `semantic model, sql analytics endpoint` <br/>
> - Grating `App audience` will enable the assigned identity to view it.

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/353d88ad-a4a7-4aef-aff4-d584901c29d8">

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1280-limegreen" alt="Total views">
  <p>Refresh Date: 2025-09-05</p>
</div>
<!-- END BADGE -->
