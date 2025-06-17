# Microsoft Fabric Pricing - Overview 

Costa Rica

[![GitHub](https://badgen.net/badge/icon/github?icon=github&label)](https://github.com) 
[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-21

----------

<details>
<summary><b>List of References </b> (Click to expand)</summary>

-  [Fabric operations](https://learn.microsoft.com/en-us/fabric/enterprise/fabric-operations)

</details>


> Each license level provides different amounts of computational power and features, allowing organizations to choose the one that best fits their needs <br/> <br/>
> `Pay-as-you-go` capacities related with specific Azure `resource groups`. This allows you to manage and allocate resources within your organizational structure more effectively. <br/> 
> `Reservation` capacities are managed at the `subscription level`. This means you can’t directly associate them with individual resource groups. Instead, they apply to the entire subscription, providing a discount for committing to a certain amount of capacity over a period of time.
> Assign the capacity to your workspace

> [!NOTE]
> The total cost of the reservation is distributed over the reservation period. This means you don't have to pay the entire amount upfront; instead, the cost is spread out, making it easier to manage and predict your expenses.

> E.g: By choosing an `F128 reservation` in Microsoft Fabric, if the pay-as-you-go rate is `$23.04 per hour`, with the reservation, you might pay `$13.706 per hour`, saving ~41%.
> `F64 around 11.52/hour, $6.853/hour` ~41% savings. Click [here to see the pricing table](https://azure.microsoft.com/en-us/pricing/details/microsoft-fabric/?msockid=38ec3806873362243e122ce086486339)

## Overview 


> [Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/?msockid=38ec3806873362243e122ce086486339) will calculate storage costs if you exceed the included limit for your selected SKU. If your usage stays within the included storage capacity, you shouldn’t see additional charges for storage. <br/> <br/> 
> The included storage in Microsoft Fabric primarily applies to **mirroring** across all F SKUs. This means that the free storage provided (e.g., 64 TB for F64) is specifically allocated for creating mirrored copies of your data to ensure redundancy and high availability. <br/> <br/>
> For other types of storage, such as general data storage or storage used by Data Factory and AI capabilities, you will be billed if you exceed the included storage or if compute capacity is paused.This applies to all F SKUs, from F2 to F2048.

https://github.com/user-attachments/assets/83447901-2227-4cf3-a89c-c8ee57d50009

> Considerations: 
- **Region and SKU Size**: The price of Microsoft Fabric services varies based on the region and the SKU size. For instance, the cost in North America is different from that in Europe. Additionally, different SKUs have specific rates. For example, an F256 SKU has a different rate compared to an F128 SKU.
- **What is an SKU?**: SKU stands for **Stock Keeping Unit**. It's a unique identifier for each distinct product and service that can be purchased. In the context of Microsoft Fabric, SKUs represent different capacities or configurations of the service. For example, an F256 SKU indicates a specific capacity of 256 Compute Units (CU).
- **What is a CU?**: CU stands for **Compute Unit**. It's a measure of the computing resources allocated to your service. Higher CU values indicate more computing power and capacity. For instance, an F256 SKU provides 256 CUs, which can handle more intensive workloads compared to an F128 SKU with 128 CUs.
- **Reservations**: When you make a reservation for Microsoft Fabric, you agree to a certain amount of consumption over a specified period. The discount from the reservation is applied as you use the service. For example, if you reserve an F256 capacity for a year, the discount will be reflected in your monthly usage charges.
- **Splitting Reservations**: You can split your reserved capacity into different SKU sizes to suit your needs. For example, if you reserve an F256 capacity, you can allocate it in various ways. You might use F128 for one project, F64 for another, and split the remaining F64 into smaller chunks like F32, F16, and F16. The total usage should add up to the reserved F256 capacity to benefit from the discount.

This flexibility allows you to optimize your Microsoft Fabric costs based on your specific requirements and usage patterns. Being clear about the sizes and regions helps ensure you get the best value for your reservation.

> [!NOTE]
> - `Capacity Units (CU)`: Measure of compute power within a SKU. Higher CUs provide more computational capacity. <br/>
> - `Power BI SKU`: Different SKUs (A, EM, P, F) cater to various needs from individual users to large enterprises. <br/>
> - `Power BI v-cores`: Virtual cores dedicated to Power BI operations, ensuring consistent performance. <br/>
> - `Included Storage`: Amount of storage included with each license. Additional storage is billed separately. <br/>
> - `Max Concurrent Users`: The maximum number of users that can simultaneously access the service. <br/>
> - `Billing for Storage`: Storage is billed when usage exceeds included storage or if compute capacity is paused.
> - `Features`: Range from basic data integration to advanced AI and ML capabilities, including real-time analytics, deep learning models, and natural language processing. <br/>

<details>
<summary><b>List of SKUs </b> (Click to expand)</summary>

| **License**   | **Capacity Units (CU)** | **Power BI SKU** | **Power BI v-cores** | **Included Storage** | **Max Concurrent Users** | **Features**                                                                                                                                                                                                 |
|---------------|-------------------------|------------------|----------------------|----------------------|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Free Trial**| 64                      | Not applicable   | 8                    | 64 TB                | 100                      | Comprehensive data analytics, Data Factory, extensive AI capabilities, including deep learning models. Ideal for organizations with extensive data needs. **Copilot:** No **AI Skills:** Yes |
| **F2**        | 2                       | Not applicable   | 0.25                 | 2 TB                 | 10                       | Basic data integration, limited to small datasets. No advanced AI capabilities. Suitable for individual users or very small projects. **Copilot:** No **AI Skills:** No |
| **F4**        | 4                       | Not applicable   | 0.5                  | 4 TB                 | 20                       | Enhanced data integration, basic data transformation capabilities. No AI features. Ideal for small teams. **Copilot:** No **AI Skills:** No |
| **F8**        | 8                       | EM/A1            | 1                    | 8 TB                 | 50                       | Includes Data Factory for ETL processes, basic AI capabilities like automated ML. Suitable for medium-sized teams. **Copilot:** No **AI Skills:** Yes |
| **F16**       | 16                      | EM2/A2           | 2                    | 16 TB                | 100                      | Advanced data integration, Data Factory, and AI capabilities including custom ML models. Supports larger teams and more complex projects. **Copilot:** No **AI Skills:** Yes |
| **F32**       | 32                      | EM3/A3           | 4                    | 32 TB                | 200                      | High-performance data processing, Data Factory, advanced AI and ML capabilities, including real-time analytics. Suitable for large teams. **Copilot:** No **AI Skills:** Yes |
| **F64**       | 64                      | P1/A4            | 8                    | 64 TB                | 500                      | Comprehensive data analytics, Data Factory, extensive AI capabilities, including deep learning models. Ideal for organizations with extensive data needs. **Copilot:** Yes **AI Skills:** Yes |
| **F128**      | 128                     | P2/A5            | 16                   | 128 TB               | 1000                     | Substantial computational power, Data Factory, advanced AI and ML, including natural language processing (NLP). Suitable for large-scale projects. **Copilot:** Yes **AI Skills:** Yes |
| **F256**      | 256                     | P3/A6            | 32                   | 256 TB               | 2000                     | Extensive data processing, Data Factory, full suite of AI capabilities, including computer vision. Supports very large teams. **Copilot:** Yes **AI Skills:** Yes |
| **F512**      | 512                     | P4/A7            | 64                   | 512 TB               | 5000                     | High-end data processing, Data Factory, advanced AI and ML, including predictive analytics. Suitable for large enterprises. **Copilot:** Yes **AI Skills:** Yes |
| **F1024**     | 1024                    | P5/A8            | 128                  | 1024 TB              | 10000                    | Maximum computational power, Data Factory, comprehensive AI capabilities, including advanced analytics and big data processing. Ideal for large-scale enterprise applications. **Copilot:** Yes **AI Skills:** Yes |
| **F2048**     | 2048                    | Not applicable   | 256                  | 2048 TB              | 20000                    | Ultimate performance, Data Factory, full suite of AI and ML capabilities, including large-scale data processing and analytics. Suitable for the largest and most complex data environments. **Copilot:** Yes **AI Skills:** Yes |

</details>

## Reservations & Capacity

> Microsoft Fabric `Reservations are agreements` for a specific time period and compute capacity. Whether using the Pay-as-you-go model or reservations, you need to create the Microsoft Fabric Capacity within a resource group. <br/> <br/>
> Reservations in Azure, including Microsoft Fabric `reservations`, are `managed at the subscription level`. This means that the reserved capacity units (CUs) apply to the entire subscription, not to individual resource groups. <br/>
> - `Reservations`: Provide a `subscription-wide discount` for committing to a certain amount of capacity over a period of time. <br/>
> - `Capacity Creation`: You create and manage Fabric `capacities within specific resource groups`, but the `cost benefits from the reservation apply at the subscription level`. 

> While manage resources within resource groups, the reservation’s cost benefits are applied across the entire subscription.

| **Aspect** | **Details** |
|------------|-------------|
| **Reservation** | - `Subscription Level Management`: When you make a reservation, it applies to the entire subscription. This means any resource within that subscription can benefit from the reserved capacity.<br/>- `Discounts`: The primary benefit of reservations is the cost savings. By committing to a certain amount of capacity over a period of time, you receive a discount compared to pay-as-you-go pricing.<br/>- `Flexibility`: While the reservation itself is at the subscription level, you can still create and manage individual capacities within different resource groups. The reserved capacity units are utilized by any eligible resources within the subscription. |
| **Capacity** | - `Creating Capacity`: Even though the reservation is at the subscription level, you still need to create the actual Fabric capacity in the Azure portal. This capacity can be assigned to specific resource groups as needed.<br/>- `Utilizing Reservations`: When you create a Fabric capacity, it will automatically utilize the reserved capacity units from your subscription, ensuring you benefit from the cost savings. |

### Scope Assignment in Reservations

| **Level**                | **Scope**                                                                                                                                       | **Usage/Management**                                                                                                                                                                                                 |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Subscription Level**   | - Reservations are applied at the subscription level.<br/>- Reserved capacity units (CUs) provide a discount for any eligible resources within the entire subscription. | Any Fabric capacity created within this subscription can utilize the reserved CUs, benefiting from the cost savings. |
| **Resource Group Level** | - Reservations are managed at the subscription level.<br/>- The reserved capacity units are not directly assigned to individual resource groups but are available for any resource within the subscription.  | You can still organize and manage your resources within different resource groups. |

## Additional Costs 

> Based on how Microsoft Fabric meters compute usage across different services. `These are billed separately if they exceed the reserved CU pool or use specialized compute`. Please
> read this to understand more about [Fabric operations](https://learn.microsoft.com/en-us/fabric/enterprise/fabric-operations)

| **Service Name** | **Description** | **Why It’s Charged Separately** |
|------------------|------------------|-------------------------------|
| **Data Movement** | Moving data between storage layers (e.g., OneLake to Lakehouse) or during ETL processes. | Uses compute resources beyond base capacity; billed per CU usage. |
| **Spark Memory Optimized** | Running Spark jobs with high memory requirements (e.g., notebooks, dataflows). | Spark workloads consume memory-optimized compute, billed separately. |
| **Data Orchestration** | Coordinating workflows like pipelines and dataflows. | Orchestration logic and execution consume compute resources. |
| **OneLake Iterative Read via Proxy** | Repeated reads from OneLake through a proxy (e.g., external tools). | Proxy access adds overhead and is metered distinctly. |
| **OneLake Other Operations** | Miscellaneous OneLake actions not categorized as read/write. | Includes metadata queries, schema checks, etc., billed separately. |
| **Power BI** | Report rendering, semantic model refreshes, and queries. | Power BI operations consume CUs, especially with large datasets. |
| **OneLake Read Operations** | Reading data from OneLake directly. | Read operations are metered based on volume and frequency. |
| **OneLake Other via Proxy** | Non-read/write operations via proxy (e.g., metadata access). | Proxy overhead and compute usage are billed separately. |
| **High Scale Dataflow Compute** | Running large-scale dataflows with high compute needs. | Uses specialized compute resources, billed per usage. |
| **OneLake Write Operations** | Writing data into OneLake. | Write operations are compute-intensive and metered. |
| **OneLake Write via Proxy** | Writing data into OneLake through a proxy. | Proxy adds latency and compute overhead, billed separately. |
| **Data Warehouse** | Running queries or loading data into Fabric Data Warehouse. | Data warehouse workloads are compute-heavy and metered. |
| **Copilot and AI** | Using AI features like Copilot for natural language queries. | AI models require dedicated compute, billed per interaction. |
| **OneLake Read via Proxy** | Reading data from OneLake through a proxy. | Similar to direct reads but with added proxy overhead. |
| **Real-Time Intelligence - Event Listener & Alert** | Listening to events and triggering alerts in real time. | Continuous monitoring and alerting consume compute resources. |

`These operations are tracked in the` [Microsoft Fabric Capacity Metrics App](https://learn.microsoft.com/en-us/fabric/enterprise/metrics-app-install?tabs=1st)`,
> where you can see how each contributes to your overall CU consumption`

## E.g F64 

> When you purchase a **Microsoft Fabric F64 reserved capacity** (64 Capacity Units) for around **\$5,002.67/month** in the **US West 2** region, you're essentially paying for a **shared pool of compute resources** that can be used across all Fabric workloads. Here's what is **included** in that flat rate:

- The **F64 reservation** gives you **64 CUs** to use across any Fabric workload.
- If your workloads **exceed 64 CUs**, you’ll be billed **pay-as-you-go** for the overage.
- **Storage and networking** costs (e.g., OneLake storage, data egress) are **not included** in the reservation
  
###  Included in F64 Reserved Capacity

> These services are covered **as long as they stay within the 64 CU limit**:

| **Service/Workload** | **Detailed Notes** |
|----------------------|--------------------|
| **Power BI (reporting, semantic models)** | Covers interactive report usage, semantic model refreshes, and DAX queries. These operations consume capacity units (CUs) from your reserved pool. As long as usage stays within the F64 CU limit, no extra charges apply. |
| **Data Warehouse (Lakehouse, SQL Endpoint)** | Includes querying structured data using SQL endpoints and managing Lakehouse tables. These workloads are compute-intensive but are included in the CU pool, meaning you can run them freely within your F64 allocation. |
| **Data Engineering (Spark Notebooks, Jobs)** | Running Spark-based notebooks, batch jobs, and transformations. These use distributed compute and memory, and are included in the CU pool unless they require memory-optimized Spark (which is billed separately). |
| **Data Factory (Pipelines, Dataflows)** | Covers orchestration of data movement and transformation using pipelines and dataflows. These are included in the base capacity, but high-scale or complex flows may push you over the CU limit. |
| **Real-Time Intelligence (Event Streams, Alerts)** | Enables ingestion and processing of real-time data streams, and triggering alerts. These workloads are continuous but are included in the CU pool as long as they don’t exceed your reserved capacity. |
| **OneLake Storage Access (Read/Write)** | Basic read and write operations to OneLake storage (e.g., accessing files, writing outputs from notebooks). These are metered against your CU pool and included in the flat rate unless accessed via proxy or in high volume. |
| **Copilot and AI** | Includes natural language interactions, code generation, and AI-assisted data exploration. These features use compute from your reserved capacity and are included unless usage spikes significantly. |
| **Monitoring & Admin Tools** | Covers usage of Fabric’s built-in monitoring dashboards, capacity metrics app, and admin tools. These are lightweight operations and fully included in the reserved capacity. |

## What’s NOT Included in the Flat Rate

> These are **billed separately** if they exceed the reserved CU pool or use **specialized compute**. These charges apply **only when usage exceeds the base F64 capacity or involves specialized compute paths**. 


| **Service/Workload** | **Why It’s Extra** |
|----------------------|--------------------|
| **Data Movement (e.g., Copy activity)** | Uses additional compute beyond base CU allocation. |
| **Spark Memory Optimized** | High-memory Spark jobs may exceed base CU or use specialized memory-optimized compute. |
| **OneLake Proxy Operations** | Proxy access (e.g., from external tools) adds overhead and is metered separately. |
| **High Scale Dataflow Compute** | Uses specialized compute resources for large-scale dataflows. |
| **Iterative Read/Write via Proxy** | Repeated access patterns through proxy connections are compute-intensive and billed separately. |
| **Networking & Storage** | Not included in Fabric capacity; billed separately under Azure storage and data transfer pricing. |


<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
