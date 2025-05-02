# Microsoft Fabric: Enterprise Framework

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-05-02

------------------------------------------

> [!IMPORTANT]
> This repository contains demos and guides for building a well-architected framework for a Microsoft Fabric enterprise-level data platform. These demos are intended as a guide.
> `For official guidance, support, or more detailed information, please refer to Microsoft's official documentation or contact Microsoft directly`: [Microsoft Sales and Support](https://support.microsoft.com/contactus?ContactUsExperienceEntryPointAssetId=S.HP.SMC-HOME). For more detailed and official training, please visit the [Microsoft official training site](https://learn.microsoft.com/en-us/training/).

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Microsoft Fabric adoption roadmap maturity levels](https://learn.microsoft.com/en-us/power-bi/guidance/fabric-adoption-roadmap-maturity-levels?context=%2Ffabric%2Fcontext%2Fcontext)
- [What is workspace monitoring (preview)?](https://learn.microsoft.com/en-us/fabric/fundamentals/workspace-monitoring-overview)
- [Azure Well-Architected Framework for data workloads](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/cloud-scale-analytics/well-architected-framework)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Prerequisites](#prerequisites)
- [Infrastructure as Code IaC](#infrastructure-as-code-iac)
- [Source Control Integration](#source-control-integration)
- [Security](#security)
- [Microsoft Purview for Fabric](#microsoft-purview-for-fabric)
- [Networking](#networking)
- [Monitoring and Observability](#monitoring-and-observability)
- [Cost Management](#cost-management)
- [Best Practices](#best-practices)

</details>

<div align="center">
  <img src="https://github.com/user-attachments/assets/8fdb3198-8fda-4dd0-869e-b0dccb268a30" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

From [Microsoft Documentation](https://learn.microsoft.com/pt-br/fabric/fundamentals/microsoft-fabric-overview)

## Prerequisites

- An `Azure subscription is required`. All other resources, including instructions for creating a Resource Group, are provided in this workshop.
- `Contributor role assigned or any custom role that allows`: access to manage all resources, and the ability to deploy resources within subscription.
- If you choose to use a Terraform approach, please ensure that:
  - [Terraform is installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform).
  - [Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) to work with both Terraform and Azure commands.

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
<summary>3. Flexibility and IaC tools Options</summary>

> Microsoft provides several IaC tools, including Terraform, Bicep, and ARM templates. Each tool offers different features and benefits, allowing you to choose the one that best fits your needs.

- **Terraform**: A popular IaC tool that uses a high-level configuration language to define and provision infrastructure. It `supports multiple cloud providers, making it a versatile choice.`
- **Bicep**: A domain-specific language that uses declarative syntax to deploy Azure resources. It offers a `concise and easy-to-read alternative to JSON-based ARM templates.`
- **ARM Templates**: JSON files that`define the infrastructure and configuration for your Azure solution.` They provide a detailed and flexible way to manage Azure resources.

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

- **Fabric Workspace Integration**: Integrate your Fabric workspace with [GitHub](./GitHub-Integration.md) or Azure DevOps to manage code related to data objects and workflows.
- **Continuous Integration/Continuous Deployment (CI/CD)**: Implement CI/CD pipelines to [automate the deployment](./Deployment-Pipelines/) of changes to your data platform.

## Security

> Implementing robust security measures ensures that sensitive data is protected, access is controlled, and compliance requirements are met.

| **Category** | **Description** |
|--------------|-----------------|
| **Identity & Access Management (IAM)** | -  **RBAC:** Assign permissions based on user roles for simplified management. <br/> -  **ABAC:** Implement dynamic, context-aware access based on attributes. <br/> -  **RLS & CLS:** Apply row- and column-level security using dynamic filters and selective visibility. <br/> -  **MFA, SSO & MSI:** Enhance authentication with multi-factor methods, streamline access via single sign-on, and utilize managed service identities to avoid hard-coded credentials. |
| **Data Protection & Encryption** | -  **Data Masking:** Hide sensitive information from unauthorized users. <br/> -  **Audit Logs:** Keep detailed records to monitor user activities and detect anomalies. <br/> -  **Encryption at Rest:** Use Azure Storage Service Encryption and Transparent Data Encryption (TDE) to protect stored data. <br/> -  **Encryption in Transit:** Secure communications with TLS/SSL protocols and VPNs. |
| **Networking & Granular Controls** | -  **Granular Security Controls:** Implement layered security measures to comprehensively protect sensitive data. <br/> -  **Networking:** Leverage Fabric’s unified platform to simplify secure network configurations. For more details, see [Networking](#networking) |

## Microsoft Purview for Fabric

> **Microsoft Purview** is a unified data governance solution that helps `organizations manage and govern` their on-premises, multi-cloud, and software-as-a-service (SaaS) data. When integrated with **Microsoft Fabric**, Purview enhances `data discovery, classification, lineage, and access control` across the entire data estate. In the context of **Microsoft Fabric**, which is an end-to-end analytics platform that unifies data engineering, data science, real-time analytics, and business intelligence, Purview plays a crucial role in:

- **Data Cataloging**: Automatically scanning and cataloging data assets across Fabric workspaces.
- **Data Lineage**: Tracking how data flows and transforms across pipelines, notebooks, and reports.
- **Access Management**: Enforcing data access policies and ensuring compliance.
- **Data Classification**: Identifying sensitive data using built-in or custom classifiers.

> When to Integrate Purview with Fabric?

1. **You need centralized data governance** across multiple data sources and services within Fabric.
2. **Compliance and regulatory requirements** demand visibility into data usage, classification, and lineage.
3. **Your organization handles sensitive data** (e.g., PII, financial data) and needs automated classification and protection.
4. **You want to empower data consumers** (analysts, scientists, engineers) to discover and understand data assets easily.
5. **You are scaling your data operations** and need consistent governance policies across teams and projects.

Click to read more about [Microsoft Purview for Fabric - Overview](./Purview-Fabric.md).

## Networking

> Networking is a critical component of any enterprise-level data platform. In Microsoft Fabric, networking configurations are simplified and secured through its `unified platform.`:
>
> - **Simplified Configuration**: Microsoft Fabric provides a unified platform that integrates different networking components, making it easier to configure and manage network settings. This unified approach reduces complexity and ensures that all networking elements work seamlessly together. <br/>
> - **Centralized Management**: With a unified platform, you can manage all networking configurations from a single interface. This centralization streamlines operations and enhances visibility into network performance and security.

| **Category**                | **Description**|
|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Virtual Networks (VNets)**| Implementing virtual networks allows you to isolate and segment different parts of your data platform. VNets provide a secure and scalable way to manage network traffic and ensure that sensitive data is protected. |
| **Subnets**                 | Within VNets, subnets can be used to further segment the network. Subnets help organize and secure resources by grouping them into smaller, manageable sections. This segmentation enhances security by limiting the scope of network access. |
| **Network Security Groups (NSGs)** | NSGs are used to control inbound and outbound traffic to network resources. By defining security rules, NSGs help protect your data platform from unauthorized access and potential threats. |
| **Private Endpoints**       | Use private endpoints to securely connect to Azure services without exposing them to the public internet. Private endpoints ensure that traffic between your data platform and Azure services remains within the Azure backbone network, enhancing security and reducing latency. |
| **Firewall Rules**          | Configure firewall rules to restrict access to your data platform. Firewalls provide an additional layer of security by blocking unauthorized traffic and allowing only trusted connections. |
| **VPN and ExpressRoute**    | For secure and reliable connectivity between on-premises environments and Azure, consider using VPN or ExpressRoute. These options provide encrypted connections and dedicated bandwidth, ensuring secure and high-performance communication. |
| **DNS Configuration**       | Proper DNS configuration ensures that resources within your data platform can be easily located and accessed. Use Azure DNS to manage domain names and resolve network addresses efficiently. |
| **Load Balancing**          | Implement load balancing to distribute network traffic across multiple resources. Load balancers enhance performance and reliability by ensuring that no single resource is overwhelmed with traffic. |
| **Monitoring and Alerts**   | Set up monitoring and alerting mechanisms to track network performance and detect potential issues. Use Azure Monitor and Network Watcher to gain insights into network health and troubleshoot problems. |

## Monitoring and Observability

- **Microsoft [Fabric Capacity Metrics](https://github.com/MicrosoftCloudEssentials-LearningHub/Fabric-EnterpriseFramework/blob/main/Monitoring-Observability/MonitorUsage.md#microsoft-fabric-capacity-metrics-app) app**: Powerful tool for administrators to `monitor and manage their capacity usage`. It provides detailed insights into `capacity utilization, throttling, and system events, helping to optimize performance and resource allocation`. By tracking these metrics, admins can make informed decisions to ensure efficient use of resources.
- **Admin Monitoring**: Configure and use the [Admin Monitoring Workspace](https://github.com/MicrosoftCloudEssentials-LearningHub/Fabric-EnterpriseFramework/blob/main/Monitoring-Observability/MonitorUsage.md#admin-monitoring) it's a centralized hub for `tracking and analyzing usage metrics across the organization`. It includes `pre-built reports and semantic models that provide insights into feature adoption, performance, and compliance`. This workspace helps administrators maintain the health and efficiency of their Fabric environment by offering a comprehensive `view of usage patterns and system events`.
- **Monitor Hub**: Access and utilize the [Monitor Hub](https://github.com/MicrosoftCloudEssentials-LearningHub/Fabric-EnterpriseFramework/blob/main/Monitoring-Observability/MonitorUsage.md#monitor-hub). Allows users to `view and track the status of activities across all workspaces they have permissions for`. It provides a detailed overview of operations, `including dataset refreshes, Spark job runs, and other activities`. With features like historical views, customizable displays, and filtering options, the Monitor Hub helps ensure smooth operations and timely interventions when needed.
- **Event Hub Integration**: Use Event Hub to capture and analyze events for real-time monitoring. For example, leverage it for [Automating pipeline execution with Activator](./Monitoring-Observability/FabricActivatorRulePipeline/)
- **Alerting**: Configure alerts for critical events and thresholds to ensure timely responses to issues. For example, [Steps to Configure Capacity Alerts](./Monitoring-Observability/StepsCapacityAlert.md)

## Cost Management 

> You can leverage `Azure Cost Management`, a suite of tools designed to help organizations monitor, allocate, and optimize their cloud spending. It provides comprehensive insights into your Azure usage and costs, enabling you to manage your budget effectively and ensure that your spending aligns with your financial goals.
 
> [!TIP] 
>
> - **Use Tags**: Ensure your resources are properly tagged to make filtering and grouping easier.
> - **Save Views**: You can save custom views in Cost Analysis for quick access in the future.
> - **Set Up Alerts**: Consider setting up cost alerts to monitor spending and avoid unexpected charges.

| Feature          | Details                                                                                   |
|------------------|-----------------------------------------------------------------------------------------------|
| **Cost Analysis**| - **Visualization**: View and analyze your costs through various charts and graphs.<br/>- **Filtering and Grouping**: Break down costs by resource, resource group, subscription, or tags to understand spending patterns. |
| **Budgeting**    | - **Create Budgets**: Set budgets for different scopes like subscriptions or resource groups.<br/>- **Alerts**: Configure alerts to notify you when spending exceeds predefined thresholds. |
| **Cost Allocation**| - **Tag Inheritance**: Enable tag inheritance to ensure costs are allocated correctly.<br/>- **Shared Costs**: Split shared costs across multiple departments or projects. |
| **Optimization** | - **Recommendations**: Receive recommendations for cost-saving opportunities.<br/>- **Anomaly Detection**: Identify and address spending anomalies proactively. |
| **Reporting**    | - **Custom Reports**: Generate custom reports to share with stakeholders.<br/>- **Power BI Integration**: Use Power BI for advanced reporting and dashboard creation. |
| **Automation**   | - **Data Export**: Automate the export of cost data to storage accounts for further analysis.<br/>- **Integration**: Integrate cost data with external tools and processes. |

> Click to read [Billing Report - Overview](./Cost-Management/BillingReport.md), and [Budget & Alerts - Overview](./Cost-Management/BudgetAlerts.md).

## Best Practices 

- [Azure Data Factory (ADF) - Best Practices Overview](./Workloads-Specific/DataFactory/BestPractices.md)
- [Data Engineering - Best Practices Overview]() - in progress
- [Data Warehouse - Best Practices Overview]() - in progress
- [Data Science - Best Practices Overview]() - in progress
- [Real-Time Intelligence - Best Practices Overview]() - in progress
- [Power Bi - Best Practices Overview]() - in progress
- [Copilot - Best Practices Overview]() - in progress
- [Purview - Best Practices Overview]() - in progress
- [OneLake - Best Practices Overview]() - in progress

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
