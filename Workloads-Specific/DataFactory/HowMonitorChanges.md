# Demostration: How to Track Pipeline Modifications

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-16

----------

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [What is Azure Data Factory?](https://learn.microsoft.com/en-us/azure/data-factory/introduction)
- [Quickstart: Get started with Azure Data Factory](https://learn.microsoft.com/en-us/azure/data-factory/quickstart-get-started)
- [Quickstart: Create a data factory by using the Azure portal](https://learn.microsoft.com/en-us/azure/data-factory/quickstart-create-data-factory)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [How to create a Data Factory in Azure](#how-to-create-a-data-factory-in-azure)
- [Create a pipeline](#create-a-pipeline)
- [How to see who modified a pipeline](#how-to-see-who-modified-a-pipeline)

</details>

## How to create a Data Factory in Azure

1. **Log in to Azure Portal**: Open your web browser and go to the Azure Portal. Enter your credentials to log in.
2. **Search for Data Factory**: Use the search bar at the top to search for `Data Factory` and select `Data Factory` from the results.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/78b857da-1550-41f4-80bd-ea81fdafc24c" />

3. **Create a New Data Factory**:
   - Click on the `+ Create` button.
   - In the "Basics" tab, fill in the required fields:
     - **Subscription**: Select your Azure subscription.
     - **Resource Group**: Select an existing resource group or create a new one.
     - **Region**: Choose the region where you want to deploy the Data Factory.
     - **Name**: Enter a unique name for your Data Factory.
     - **Version**: Select V2 (the latest version).
4. **Configure Git (Optional)**: If you want to configure Git for source control, you can do so in the `Git configuration` tab. This step is optional and can be skipped if not needed.

> [!NOTE]
> Or later (crucial for source control or auditing):
<img width="250" alt="image" src="https://github.com/user-attachments/assets/e5dfe437-6d76-4b51-9b87-5fb82d455f15">

5. **Review and Create**:
   - Click on the `Review + create` button.
   - Review your settings and click `Create` once the validation passes.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/3dbdc4a4-2a41-487e-9a2a-628921381dfe" />

6. **Wait for Deployment**: The deployment process will take a few minutes. Once it's complete, you will see a notification.
7. **Access Data Factory**: After the deployment is complete, click on the `Go to resource` button to access your new Data Factory.
8. **Launch Data Factory Studio**: In the Data Factory resource page, click on the `Launch Studio` tile to launch the Data Factory Studio where you can start creating pipelines and other data integration tasks.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/2fae2d31-54d0-40f0-adab-111f5b464cab" />

## Create a pipeline 

1. **Log in to Azure Portal**: Open your web browser and go to the Azure Portal. Enter your credentials to log in.
2. **Go to Data Factory**: Use the search bar at the top to search for `Data Factory` and select your Data Factory instance from the list.
3. **Launch Data Factory Studio**: In the Data Factory resource page, click on the `Launch Studio` tile to launch the Data Factory Studio where you can start creating pipelines and other data integration tasks.

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/2fae2d31-54d0-40f0-adab-111f5b464cab" />

4. **Create a New Pipeline**:
   - Click on the `New` next to `Pipelines` in the tree view.
   - Select `Pipeline` from the dropdown menu.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/5f112ab1-5327-49d9-bce6-b8ee98f23267" />

5. **Add Activities to the Pipeline**:
   - In the pipeline canvas, click on the `Activities` pane on the left.
   - Drag and drop the desired activities (e.g., Copy Data, Data Flow) onto the pipeline canvas.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/fd21dfaf-8e3f-4265-8ff7-1f44098b4827" />

6. **Configure Activities**:
   - Click on each activity on the canvas to configure its properties.
   - For example, if you are using a Copy Data activity, you will need to specify the source and destination datasets.

7. **Set Up Linked Services**:
   - Linked services are used to define the connection information for data sources and destinations.
   - Go to the `Manage` tab on the left, then click on `Linked services`.
   - Click on the **+ New** button to create a new linked service and configure the connection details.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/a6ca86d0-754d-4b1d-bd27-8f45da00fbe0" />

8. **Create Datasets**:
   - Datasets represent the data structures within the data stores.
   - Go to the `Author` tab, then click on `Datasets`.
   - Click on the `+ (plus) icon` to create a new dataset and configure its properties.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/56ef28cb-8e57-4e70-8322-7ad6777bb886" />

9. **Validate the Pipeline**: Click on the `Validate` button at the top of the pipeline canvas to check for any errors or missing configurations.
10. **Publish the Pipeline**: Once validation is successful, click on the `Publish All` button to save and publish your pipeline.
11. **Trigger the Pipeline**: Click on `Trigger now` to run the pipeline immediately, or configure a trigger for scheduled runs.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/0c42c3e3-57a8-4111-add4-1ea7192b6ac8" />

12. **Monitor Pipeline Runs**: In the `Monitor` tab, you can view the status of pipeline runs, check for any errors, and review the execution details.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/11922b16-2d9e-49d8-b0ab-13605a18018f" />

 ## How to see who modified a pipeline 

1. **Log in to Azure Portal**: Open your web browser and go to the Azure Portal. Enter your credentials to log in.
2. **Go to Azure Data Factory**: Once logged in, use the search bar at the top to search for `Data Factory` and select your Data Factory instance from the list.
3. **Open the Activity Log**:
   - In the Data Factory resource page, look for the `Activity log` option in the left-hand menu under the `Monitoring` section.
   - Click on `Activity log` to open the log view.
4. **View Activity Log Details**:
   - In the Activity Log, you will see a list of events related to your Data Factory.
   - You can see columns such as `Operation Name`, `Status`, `Event Initiated By`, `Time`,`Subscription`, and more.
5. **Filter and Search**:
   - Use the filters at the top to narrow down the events by time range, resource group, resource, and more.
   - You can also use the search bar to find specific events or operations.
6. **Review Event Details**: Click on any event in the list to view more detailed information about that event, including the JSON payload with additional properties.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/07cf4582-6b7b-451e-94e9-9557cdbfd09f">

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
