# Microsoft Fabric: Automating Pipeline Execution with Activator

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-05

----------

> This process shows how to set up Microsoft Fabric Activator to automate workflows by detecting file creation events in a storage system and triggering another pipeline to run. <br/>
> 1. **First Pipeline**: The process starts with a pipeline that ends with a `Copy Data` activity. This activity uploads data into the `Lakehouse`. <br/>
> 2. **Event Stream Setup**: An `Event Stream` is configured in Activator to monitor the Lakehouse for file creation or data upload events. <br/>
> 3. **Triggering the Second Pipeline**: Once the event is detected (e.g., a file is uploaded), the Event Stream triggers the second pipeline to continue the workflow.

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Activate Fabric items](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/data-activator/activator-trigger-fabric-items)
- [Create a rule in Fabric Activator](https://learn.microsoft.com/en-us/fabric/real-time-intelligence/data-activator/activator-create-activators)

</details>

<details>
<summary><b>List of Content </b> (Click to expand)</summary>

 - [Set Up the First Pipeline](#set-up-the-first-pipeline)
 - [Configure Activator to Detect the Event](#configure-activator-to-detect-the-event)
 - [Set Up the Second Pipeline](#set-up-the-second-pipeline)
 - [Define the Rule in Activator](#define-the-rule-in-activator)
 - [Test the Entire Workflow](#test-the-entire-workflow)
 - [Troubleshooting If Needed](#troubleshooting-if-needed)

</details>

> [!NOTE]
> This code generates random data with fields such as id, name, age, email, and created_at, organizes it into a PySpark DataFrame, and saves it to a specified Lakehouse path using the Delta format. Click here to see the [example script](./GeneratesRandomData.ipynb)

https://github.com/user-attachments/assets/95206bf3-83a7-42c1-b501-4879df22ef7d

## Set Up the First Pipeline

1. **Create the Pipeline**:
   - In [Microsoft Fabric](https://app.fabric.microsoft.com/), create the first pipeline that performs the required tasks.
   - Add a `Copy Data` activity as the final step in the pipeline.

2. **Generate the Trigger File**:
   - Configure the `Copy Data` activity to create a trigger file in a specific location, such as `Azure Data Lake Storage (ADLS)` or `OneLake`.
   - Ensure the file name and path are consistent and predictable (e.g., `trigger_file.json` in a specific folder).
3. **Publish and Test**: Publish the pipeline and test it to ensure the trigger file is created successfully.

   https://github.com/user-attachments/assets/798a3b12-c944-459d-9e77-0112b5d82831

## Configure Activator to Detect the Event

> [!TIP]
> Event options:

https://github.com/user-attachments/assets/282fae9b-e1c6-490d-bd23-9ed9bdf6105d

1. **Set Up an Event**:
   - Create a new event to monitor the location where the trigger file is created (e.g., ADLS or OneLake). Click on `Real-Time`:

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/e1ce1f83-a8f6-4a3c-94dc-749e370d8079" />

   - Choose the appropriate event type, such as `File Created`.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/3a21abd7-0ff4-428f-a3a1-5e387314c1f5" />

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/94e5556b-5d56-4a42-9edd-83b514e7c953" />

   - Add a source:
        
        <img width="550" alt="image" src="https://github.com/user-attachments/assets/9709a690-f3b5-453b-b3d9-c67d4b1a9465" />

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/8dcadd23-4abb-47ee-82ca-f3868cb818e1" />

   https://github.com/user-attachments/assets/43a9654b-e8d0-44da-80b9-9f528483fa3b

2. **Test Event Detection**:
   - Save the event and test it by manually running the first pipeline to ensure Activator detects the file creation.
   - Check the **Event Details** screen in Activator to confirm the event is logged.

   https://github.com/user-attachments/assets/6b21194c-54b4-49de-9294-1bf78b1e5acd

## Set Up the Second Pipeline

1. **Create the Pipeline**:
   - In Microsoft Fabric, create the second pipeline that performs the next set of tasks.
   - Ensure it is configured to accept external triggers.
2. **Publish the Pipeline**: Publish the second pipeline and ensure it is ready to be triggered.

   https://github.com/user-attachments/assets/5b630579-a0ec-4d5b-b973-d9b4fdd8254c

## Define the Rule in Activator

1. **Setup the Activator**:

   https://github.com/user-attachments/assets/7c88e080-d5aa-4920-acd6-94c2e4ae0568

2. **Create a New Rule**:
   - In `Activator`, create a rule that responds to the event you just configured.
   - Set the condition to match the event details (e.g., file name, path, or metadata).
3. **Set the Action**:
   - Configure the rule to trigger the second pipeline.
   - Specify the pipeline name and pass any required parameters.
3. **Save and Activate**:
   - Save the rule and activate it.
   - Ensure the rule is enabled and ready to respond to the event.

   https://github.com/user-attachments/assets/5f139eeb-bab0-4d43-9f22-bbe44503ed75

## Test the Entire Workflow

1. **Run the First Pipeline**: Execute the first pipeline and verify that the trigger file is created.
2. **Monitor Activator**: Check the `Event Details` and `Rule Activation Details` in Activator to ensure the event is detected and the rule is activated.
3. **Verify the Second Pipeline**: Confirm that the second pipeline is triggered and runs successfully.

   https://github.com/user-attachments/assets/0a1dab70-2317-4636-b0be-aa0cb301b496

## Troubleshooting (If Needed)
- If the second pipeline does not trigger:
  1. Double-check the rule configuration in Activator.
  2. Review the logs in Activator for any errors or warnings.

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

