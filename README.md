# Microsoft Fabric: Enterprise Framework

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-15

------------------------------------------

> [!IMPORTANT]
> This repository contains demos and guides for building a well-architected framework for a Microsoft Fabric enterprise-level data platform. These demos are intended as a guide.
> `For official guidance, support, or more detailed information, please refer to Microsoft's official documentation or contact Microsoft directly`: [Microsoft Sales and Support](https://support.microsoft.com/contactus?ContactUsExperienceEntryPointAssetId=S.HP.SMC-HOME). For more detailed and official training, please visit the [Microsoft official training site](https://learn.microsoft.com/en-us/training/).


<details>
<summary><b>List of References </b> (Click to expand)</summary>
  

</details>


<details>
<summary><b>Table of Content </b> (Click to expand)</summary>
  

</details>

## Prerequisites

- An `Azure subscription is required`. All other resources, including instructions for creating a Resource Group, are provided in this workshop.
- `Contributor role assigned or any custom role that allows`: access to manage all resources, and the ability to deploy resources within subscription.
- If you choose to use a Terraform approach, please ensure that:
  -  [Terraform is installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform).
  -  [Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) to work with both Terraform and Azure commands.

## Infrastructure as Code (IaC)

> Is crucial for modern cloud-based solutions and applications. Here is why:

<details>
<summary>1. Consistency and Reproducibility</summary>

 - **Consistent Environments**: IaC ensures that your development, testing, and production environments are consistent. `This reduces the it works on my machine problem` and ensures that applications run reliably across different environments.
 - **Reproducibility**: With IaC, you can `recreate your infrastructure from scratch in a consistent manner.` This is particularly useful for `disaster recovery and scaling`.
   
</details>

<details>
<summary>2. Version Control</summary>

 - **Source Control**: By storing IaC configurations in version control systems like GitHub, you `can track changes, collaborate with team members, and roll back to previous versions if needed.`
 - **Change Management**: Version control `provides a history of changes, making it easier to understand what changes were made, who made them, and why.`
   
</details>

<details>
<summary>3. Flexibility and Options</summary>


> Microsoft provides several IaC tools, including Terraform, Bicep, and ARM templates. Each tool offers different features and benefits, allowing you to choose the one that best fits your needs.

   - **Terraform**: A popular IaC tool that uses a high-level configuration language to define and provision infrastructure. It `supports multiple cloud providers, making it a versatile choice.`
   - **Bicep**: A domain-specific language that uses declarative syntax to deploy Azure resources. It offers a `concise and easy-to-read alternative to JSON-based ARM templates.`
   - **ARM Templates**: JSON files that` define the infrastructure and configuration for your Azure solution.` They provide a detailed and flexible way to manage Azure resources.
     
</details>

<details>
<summary>4. Enhanced Security</summary>

- **Automated Security Policies**: IaC allows you to `define and enforce security policies automatically.` This ensures that security best practices are `consistently applied across all environments.`
- **Compliance**: IaC helps maintain compliance with `regulatory requirements by providing a clear and auditable trail of infrastructure changes.`

</details>

<details>
<summary>5. Scalability</summary>

- **Dynamic Scaling**: IaC enables `dynamic scaling of resources based on demand.` This ensures that your infrastructure can handle varying workloads efficiently.
- **Resource Optimization**: By automating the `provisioning and de-provisioning of resources,` IaC helps optimize resource usage and reduce costs.
 
</details>

<details>
<summary>6. Automation</summary>

- **Automated Provisioning**: IaC allows you to `automate the provisioning of infrastructure. This reduces manual errors, speeds up deployments, and ensures that infrastructure changes are applied consistently.`
- **CI/CD Integration**: Integrating IaC with `Continuous Integration/Continuous Deployment (CI/CD) pipelines automates the deployment process, ensuring that infrastructure changes are tested and deployed alongside application code.`

</details>


> [!TIP]
> Just in case, find here some [additional Terraform templates for different Azure resources across different areas](https://github.com/MicrosoftCloudEssentials-LearningHub/AzureTerraformTemplates-v0.0.0). 

> E.g [Demonstration: Deploying Azure Resources for a Data Platform](./Terraform)

<div align="center">
  <img src="https://github.com/user-attachments/assets/16640052-7f57-443a-9efd-30855de5e231" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

## Source Control Integration

- **Fabric Workspace Integration**: Integrate your Fabric workspace with GitHub or Azure DevOps to manage code related to data objects and workflows.
- **Continuous Integration/Continuous Deployment (CI/CD)**: Implement CI/CD pipelines to [automate the deployment](./Deployment-Pipelines/) of changes to your data platform.

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
