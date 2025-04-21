# Demostration: How to integrate AI in Microsoft Fabric

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-21

------------------------------------------

> Fabric's OneLake datastore provides a unified data storage solution that supports differents data formats and sources. This feature simplifies data access and management, enabling efficient data preparation and model training.

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Unleashing the Power of Microsoft Fabric and SynapseML](https://blog.fabric.microsoft.com/en-us/blog/unleashing-the-power-of-synapseml-and-microsoft-fabric-a-guide-to-qa-on-pdf-documents-2)
- [Building a RAG application with Microsoft Fabric](https://techcommunity.microsoft.com/t5/startups-at-microsoft/building-high-scale-rag-applications-with-microsoft-fabric/ba-p/4217816)
- [Building Custom AI Applications with Microsoft Fabric: Implementing Retrieval-Augmented Generation](https://support.fabric.microsoft.com/en-us/blog/building-custom-ai-applications-with-microsoft-fabric-implementing-retrieval-augmented-generation-for-enhanced-language-models?ft=Alicia%20Li%20%28ASA%29:author)
- [Avail the Power of Microsoft Fabric from within Azure Machine Learning](https://techcommunity.microsoft.com/t5/ai-machine-learning-blog/avail-the-power-of-microsoft-fabric-from-within-azure-machine/ba-p/3980702)
- [AI and Machine Learning on Databricks - Azure Databricks | Microsoft Learn]( https://learn.microsoft.com/en-us/azure/databricks/machine-learning)
- [Training and Inference of LLMs with PyTorch Fully Sharded Data Parallel](https://techcommunity.microsoft.com/t5/microsoft-developer-community/training-and-inference-of-llms-with-pytorch-fully-sharded-data/ba-p/3845995)
- [Harness the Power of LangChain in Microsoft Fabric for Advanced Document Summarization](https://blog.fabric.microsoft.com/en-us/blog/harness-the-power-of-langchain-in-microsoft-fabric-for-advanced-document-summarization)
- [Integrating Azure AI and Microsoft Fabric for Next-Gen AI Solutions](https://build.microsoft.com/en-US/sessions/91971ab3-93e4-429d-b2d7-5b60b2729b72)
- [Generative AI with Microsoft Fabric](https://techcommunity.microsoft.com/t5/microsoft-mechanics-blog/generative-ai-with-microsoft-fabric/ba-p/4219444)
- [Harness Microsoft Fabric AI Skill to Unlock Context-Rich Insights from Your Data](https://blog.fabric.microsoft.com/en-us/blog/harness-microsoft-fabric-ai-skill-to-unlock-context-rich-insights-from-your-data)
- [LangChain-AzureOpenAI Parameter API Reference](https://python.langchain.com/api_reference/openai/chat_models/langchain_openai.chat_models.azure.AzureChatOpenAI.html#)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Overview](#overview)
- [Demo](#demo)
  - [Set Up Your Environment](#set-up-your-environment)
  - [Install Required Libraries](#install-required-libraries)
  - [Configure Azure OpenAI Service](#configure-azure-openai-service)
  - [Basic Usage of LangChain Transformer](#basic-usage-of-langchain-transformer)
  - [Using LangChain for Large Scale Literature Review](#using-langchain-for-large-scale-literature-review)
  - [Machine Learning Integration with Microsoft Fabric](#machine-learning-integration-with-microsoft-fabric)

</details>

## Overview

> Microsoft Fabric is a comprehensive data analytics platform that brings together various data services to provide an end-to-end solution for data engineering, data science, data warehousing, real-time analytics, and business intelligence. It's designed to simplify the process of working with data and to enable organizations to gain insights more efficiently. <br/> <br/>
> Capabilities Enabled by LLMs: <br/>
>
> - `Document Summarization`: LLMs can process and summarize large documents, making it easier to extract key information. <br/>
> - `Question Answering:` Users can perform Q&A tasks on PDF documents, allowing for interactive data exploration. <br/>
> - `Embedding Generation`: LLMs can generate embeddings for document chunks, which can be stored in a vector store for efficient search and retrieval.

## Demo

Tools in practice:

| **Tool**     | **Description**|
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **LangChain**| LangChain is a framework for developing applications powered by language models. It can be used with Azure OpenAI to build applications that require natural language understanding and generation. <br>**Use Case**: Creating complex applications that involve multiple steps or stages of processing, such as preprocessing text data, applying a language model, and postprocessing the results. |
| **SynapseML**| SynapseML is an open-source library that simplifies the creation of massively scalable machine learning pipelines. It integrates with Azure OpenAI to provide distributed computing capabilities, allowing you to apply large language models at scale. <br>**Use Case**: Applying powerful language models to massive amounts of data, enabling scenarios like batch processing of text data or large-scale text analytics. |

### Set Up Your Environment

1. **Register the Resource Provider**: Ensure that the `microsoft.fabric` resource provider is registered in your subscription.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/de708b6b-90e9-42b0-957a-7c045d15f699">

2. **Create a Microsoft Fabric Resource**:
   - Navigate to the Azure Portal.
   - Create a new resource of type **Microsoft Fabric**.
   - Choose the appropriate subscription, resource group, capacity name, region, size, and administrator.

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/a860911c-0ab8-469e-82d9-d0495268bd3b">

3. **Enable Fabric Capacity in Power BI**:
   - Go to the Power BI workspace.
   - Select the Fabric capacity license and the Fabric resource created in Azure.

        <img width="550" alt="image" src="https://github.com/user-attachments/assets/5dae8ea7-528d-4742-af51-b877d4610fa4">

4. **Pause Fabric Compute When Not in Use**: To save costs, remember to pause the Fabric compute in Azure when you're not using it.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/117d6902-cc8b-45b8-a104-9b54180565f2">

### Install Required Libraries

1. **Access Microsoft Fabric**:
   - Open your web browser and navigate to the Microsoft Fabric portal.
   - Sign in with your Azure credentials.
2. **Select Your Workspace**: From the Microsoft Fabric home page, select the workspace where you want to configure SynapseML.
3. **Create a New Cluster**:
   - Within the **Data Science** component, you should find options to create a new cluster.

       <img width="182" alt="image" src="https://github.com/user-attachments/assets/1763b8a0-e3ff-4ae7-adc9-413f0eb454f3">

   - Follow the prompts to configure and create your cluster, specifying the details such as cluster name, region, node size, and node count.

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/6cf15794-27cb-4ee9-af66-ac236b14de1e">

       <img width="550" alt="image" src="https://github.com/user-attachments/assets/63e07b66-48f1-4d99-8f2d-615a25dd10ee">

4. **Install SynapseML on Your Cluster**: Configure your cluster to include the SynapseML package.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/a2243d3a-17f2-456b-829c-06c22f8ab7b7">

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/74272c11-d607-407e-ba4a-977590951046">

    ~~~
    %pip show synapseml
    ~~~

5. **Install LangChain and Other Dependencies**:
   > You can use `%pip install` to install the necessary packages

     ```python
     %pip install openai langchain_community
     ```

    Or you can use the environment configuration:

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/b61d180c-d7e5-4aec-a4b9-8133b3a92250">

    You can also try with the `.yml file` approach. Just upload your list of dependencies. E.g:

    ```yml
    dependencies:
      - pip:
          - synapseml==1.0.8
          - langchain==0.3.4
          - langchain_community==0.3.4
          - openai==1.53.0
          - langchain.openai==0.2.4
    ```

### Configure Azure OpenAI Service

> [!NOTE]
> Click [here](./src/fabric-llms-overview_sample.ipynb) to see all notebook

1. **Set Up API Keys**: Ensure you have the API key and endpoint URL for your deployed model. Set these as environment variables

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/a2eb24bf-7279-4f4e-be00-408dbbd82600">

     ```python
    import os
    
    # Set the API version for the Azure OpenAI service
    os.environ["OPENAI_API_VERSION"] = "2023-08-01-preview"
    
    # Set the base URL for the Azure OpenAI service
    os.environ["AZURE_OPENAI_ENDPOINT"] = "https://your-resource-name.openai.azure.com"
    
    # Set the API key for Azure OpenAI
    os.environ["AZURE_OPENAI_API_KEY"] = "your-api-key"
     ```

2. **Initialize Azure OpenAI Class**: Create an instance of the Azure OpenAI class using the environment variables set above.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/e9fad52c-5c64-4047-8f22-cef80ce33d6e">

     ```python
    from langchain_openai import AzureChatOpenAI
    
    # Set the API base URL
    api_base = os.environ["AZURE_OPENAI_ENDPOINT"]
    
    # Create an instance of the Azure OpenAI Class
    llm = AzureChatOpenAI(
        openai_api_key=os.environ["AZURE_OPENAI_API_KEY"],
        temperature=0.7,
        verbose=True,
        top_p=0.9
    )
     ```

3. **Call the Deployed Model**: Use the Azure OpenAI service to generate text or perform other language model tasks. Here's an example of generating a response based on a prompt

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/b6cfccfe-42b6-45f6-9d84-6189c1222f92">

     ```python
    # Define a prompt
    messages = [
        (
            "system",
            "You are a helpful assistant that translates English to French. Translate the user sentence.",
        ),
        ("human", "Hi, how are you?"),
    ]
    
    # Generate a response from the Azure OpenAI service using the invoke method
    ai_msg = llm.invoke(messages)
    
    # Print the response
    print(ai_msg)
     ```

Make sure to replace `"your_openai_api_key"`, `"https://your_openai_api_base/"`, `"your_deployment_name"`, and `"your_model_name"` with your actual API key, base URL, deployment name, and model name from your Azure OpenAI instance. This example demonstrates how to configure and use an existing Azure OpenAI instance in Microsoft Fabric.

### Basic Usage of LangChain Transformer

> [!NOTE]
> E.g: Automate the process of generating definitions for technology terms using a language model.
> `The LangChain Transformer` is a tool that makes it easy to use advanced language models for `generating and transforming text`. It works by `setting up a template for what you want to create, linking this template to a language model, and then processing your data to produce the desired output`. This setup `helps automate tasks like defining technology terms or generating other text-based content`, making your workflow smoother and more efficient.

> `LangChain Transformer helps you automate the process of generating and transforming text data using advanced language models`, making it easier to integrate AI capabilities into your data workflows. <br/>
>
> 1. `Prompt Creation`: Start by `defining a template for the kind of text you want to generate or analyze`. For example, you might create a prompt that asks the model to define a specific technology term.  <br/>
> 2. `Chain Setup`: Then `set up a chain that links this prompt to a language model`. This chain is responsible for sending the prompt to the model and receiving the generated response.  <br/>
> 3. `Transformer Configuration`: The LangChain Transformer is `configured to use this chain`. It specifies how the `input data (like a list of technology names) should be processed and what kind of output (like definitions) should be produced`.  <br/>
> 4. `Data Processing`: Finally, `apply this setup to a dataset.` E.g., list of technology names in a DataFrame, and the transformer will use the language model to generate definitions for each technology.

1. **Create a Prompt Template**: Define a prompt template for generating definitions.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/f4a3dea8-d743-46e0-a6e9-279aae457bc8">

     ```python
     from langchain.prompts import PromptTemplate

     copy_prompt = PromptTemplate(
         input_variables=["technology"],
         template="Define the following word: {technology}",
     )
     ```

2. **Set Up an LLMChain**: Create an LLMChain with the defined prompt template.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/30a74226-7a02-4c81-a4b1-4039eb43fa9c">

     ```python
     from langchain.chains import LLMChain

     chain = LLMChain(llm=llm, prompt=copy_prompt)
     ```

3. **Configure LangChain Transformer**: Set up the LangChain transformer to execute the processing chain.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/f7d6480a-b75e-449e-808d-ad5a51974af9">

     ```python
    # Set up the LangChain transformer to execute the processing chain.
    from synapse.ml.cognitive.langchain import LangchainTransformer
    
    openai_api_key= os.environ["AZURE_OPENAI_API_KEY"]
    
    transformer = (
        LangchainTransformer()
        .setInputCol("technology")
        .setOutputCol("definition")
        .setChain(chain)
        .setSubscriptionKey(openai_api_key)
        .setUrl(api_base)
    )
     ```

4. **Create a Test DataFrame**: Construct a DataFrame with technology names.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/a2a8e208-6f1d-4cb0-9944-0d2457106b49">

     ```python
    from pyspark.sql import SparkSession
    from pyspark.sql.functions import udf
    from pyspark.sql.types import StringType
    
    # Initialize Spark session
    spark = SparkSession.builder.appName("example").getOrCreate()
    
    # Construct a DataFrame with technology names
    df = spark.createDataFrame(
        [
            (0, "docker"), (1, "spark"), (2, "python")
        ],
        ["label", "technology"]
    )
    
    # Define a simple UDF to transform the technology column
    def transform_technology(tech):
        return tech.upper()
    
    # Register the UDF
    transform_udf = udf(transform_technology, StringType())
    
    # Apply the UDF to the DataFrame
    transformed_df = df.withColumn("transformed_technology", transform_udf(df["technology"]))
    
    # Show the transformed DataFrame
    transformed_df.show()
     ```

### Using LangChain for Large Scale Literature Review

> [!NOTE]
> E.g: Automating the extraction and summarization of academic papers: script for an agent using LangChain to extract content from an online PDF and generate a prompt based on that content.
> An `agent` in the context of programming and artificial intelligence is a `software entity that performs tasks autonomously`. It can interact with its`environment, make decisions, and execute actions based on predefined rules or learned behavior.`

1. **Define Functions for Content Extraction and Prompt Generation**: Extract content from PDFs linked in arXiv papers and generate prompts for extracting specific information.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/54b0b122-e71e-4040-ad69-dd01b0411b3f">

     ```python
     from langchain.document_loaders import OnlinePDFLoader

     def paper_content_extraction(inputs: dict) -> dict:
         arxiv_link = inputs["arxiv_link"]
         loader = OnlinePDFLoader(arxiv_link)
         pages = loader.load_and_split()
         return {"paper_content": pages[0].page_content + pages[1].page_content}

     def prompt_generation(inputs: dict) -> dict:
         output = inputs["Output"]
         prompt = (
             "find the paper title, author, summary in the paper description below, output them. "
             "After that, Use websearch to find out 3 recent papers of the first author in the author section below "
             "(first author is the first name separated by comma) and list the paper titles in bullet points: "
             "<Paper Description Start>\n" + output + "<Paper Description End>."
         )
         return {"prompt": prompt}
     ```

2. **Create a Sequential Chain for Information Extraction**: Set up a chain to extract structured information from an arXiv link

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/3980b019-f3c7-4614-a27e-c2692e8d4f47">

     ```python
     from langchain.chains import TransformChain, SimpleSequentialChain

     paper_content_extraction_chain = TransformChain(
         input_variables=["arxiv_link"],
         output_variables=["paper_content"],
         transform=paper_content_extraction,
         verbose=False,
     )

     paper_summarizer_template = """
     You are a paper summarizer, given the paper content, it is your job to summarize the paper into a short summary, 
     and extract authors and paper title from the paper content.
     """
     ```

### Machine Learning Integration with Microsoft Fabric

1. **Train and Register Machine Learning Models**: Use Microsoft Fabric's native integration with the MLflow framework to log the trained machine learning models, the used hyperparameters, and evaluation metrics.

    <img width="550" alt="image" src="https://github.com/user-attachments/assets/a6eebe61-bfde-48ce-88e7-9bd5dfb6d00a">

     ```python
    import mlflow
    from mlflow.models import infer_signature
    from sklearn.datasets import make_regression
    from sklearn.ensemble import RandomForestRegressor
    
    # Generate synthetic regression data
    X, y = make_regression(n_features=4, n_informative=2, random_state=0, shuffle=False)
    
    # Model parameters
    params = {"n_estimators": 3, "random_state": 42}
    
    # Model tags for MLflow
    model_tags = {
        "project_name": "grocery-forecasting",
        "store_dept": "produce",
        "team": "stores-ml",
        "project_quarter": "Q3-2023"
    }
    
    # Log MLflow entities
    with mlflow.start_run() as run:
        # Train the model
        model = RandomForestRegressor(**params).fit(X, y)
    
        # Infer the model signature
        signature = infer_signature(X, model.predict(X))
    
        # Log parameters and the model
        mlflow.log_params(params)
        mlflow.sklearn.log_model(model, artifact_path="sklearn-model", signature=signature)
    
        # Register the model with tags
        model_uri = f"runs:/{run.info.run_id}/sklearn-model"
        model_version = mlflow.register_model(model_uri, "RandomForestRegressionModel", tags=model_tags)
    
        # Output model registration details
        print(f"Model Name: {model_version.name}")
        print(f"Model Version: {model_version.version}")
     ```

2. **Compare and Filter Machine Learning Models**: Use MLflow to search among multiple models saved within the workspace.

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/d39e2a0e-3dde-4138-aafc-48d3d680bc93">

     ```python
    from pprint import pprint
    from mlflow.tracking import MlflowClient
    
    client = MlflowClient()
    for rm in client.search_registered_models():
        pprint(dict(rm), indent=4)
     ```

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
