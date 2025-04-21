# Troubleshooting: Known Errors

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-21

------------------------------------------

## Content

- [Terraform is not recognized](#terraform-is-not-recognized)
  - [Step 1: Download Terraform](#step-1-download-terraform)
  - [Step 2: Install Terraform](#step-2-install-terraform)
    - [For Windows:](#for-windows)
    - [For macOS:](#for-macos)
    - [For Linux:](#for-linux)
  - [Step 3: Verify the Installation](#step-3-verify-the-installation)
  - [Step 4: Initialize Terraform](#step-4-initialize-terraform)
- [Resource Group Not Found](#resource-group-not-found)
- [Resource Not Found](#resource-not-found)

## Terraform is not recognized

> Terraform is not recognized because it's not installed or not added to your system's PATH

```
terraform : The term 'terraform' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the 
spelling of the name, or if a path was included, verify that the path is correct and try again.
At line:1 char:1
+ terraform init
+ ~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (terraform:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException
```

<p align="center">
    <img width="990" alt="image" src="https://github.com/user-attachments/assets/98076919-f13a-4461-aa34-55a8bff3d1fc" />
</p>

### Step 1: Download Terraform

> By command line:

1. Open your command prompt.
2. Use curl to download Terraform. Replace VERSION with the desired version number (e.g., 1.1.4):

      ```
      curl -o terraform.zip https://releases.hashicorp.com/terraform/VERSION/terraform_VERSION_windows_amd64.zip
      ```

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/473128f5-f146-4933-8b50-4afa59613810" />

3. Use tar to extract the ZIP file:

      ```
      tar -xvf terraform.zip
      ```

      <img width="316" alt="image" src="https://github.com/user-attachments/assets/c81fb71b-e30b-431e-8974-306ebca51418" />

> By GUI:

1. Go to the [Terraform download page](https://developer.hashicorp.com/terraform/install).
2. Download the appropriate package for your operating system (e.g., Windows, macOS, Linux).

     <img width="550" alt="image" src="https://github.com/user-attachments/assets/58796ec5-9111-4d43-b5be-def40eab7922" />

### Step 2: Install Terraform

#### For Windows

1. Extract the downloaded ZIP file to a directory of your choice (e.g., `C:\terraform`).

   <img width="479" alt="image" src="https://github.com/user-attachments/assets/a77f337f-d78d-4198-a838-bc802ef371f4" />

2. Add the directory to your system's PATH:
  
      > By command line: <br/> `Assuming you have moved terraform.exe to C:\terraform, you can add this directory to the PATH using the following command`

      ```
      setx PATH "%PATH%;C:\terraform"
      ```

      <img width="550" alt="image" src="https://github.com/user-attachments/assets/dd5fc584-e6b6-4922-a8cd-38a55afb99b1" />

      > By GUI:
      - Open the Start menu and search for `Environment Variables`.
      - Click on `Edit the system environment variables`

          <img width="550" alt="image" src="https://github.com/user-attachments/assets/495b8e1a-ca79-4103-b743-ed35ad190bec" />

      - In the System Properties window, click on `Environment Variables`.

           <img width="299" alt="image" src="https://github.com/user-attachments/assets/c5560100-5d3b-4461-a80d-eb1c1c2ede99" />

      - Under `System variables`, find the `Path` variable and click `Edit`.
      - Click `New` and add the path to the directory where you extracted Terraform (e.g., `C:\terraform`).
      - Click `OK` to close all windows.

#### For macOS

1. Open a terminal.
2. Move the Terraform binary to a directory included in your PATH (e.g., `/usr/local/bin`):

   ```sh
   sudo mv ~/Downloads/terraform /usr/local/bin/
   ```

3. Ensure the directory is in your PATH by adding the following line to your `~/.bash_profile` or `~/.zshrc` file:

   ```sh
   export PATH=$PATH:/usr/local/bin
   ```

4. Reload your profile:

   ```sh
   source ~/.bash_profile  # or source ~/.zshrc
   ```

#### For Linux

1. Open a terminal.
2. Move the Terraform binary to a directory included in your PATH (e.g., `/usr/local/bin`):

   ```sh
   sudo mv ~/Downloads/terraform /usr/local/bin/
   ```

3. Ensure the directory is in your PATH by adding the following line to your `~/.bashrc` or `~/.profile` file:

   ```sh
   export PATH=$PATH:/usr/local/bin
   ```

4. Reload your profile:

   ```sh
   source ~/.bashrc  # or source ~/.profile
   ```

### Step 3: Verify the Installation

1. Open a new terminal or command prompt.
2. Run the following command to verify the installation. You should see the installed version of Terraform.

   ```sh
   terraform -version
   ```

### Step 4: Initialize Terraform

Now you can run the `terraform init` command in your project directory:

```sh
terraform init
```

## Resource Group Not Found

> Please ensure you create your resource group before running the configuration and deployment. This error occurs because the specified resource group does not exist.

```
Error: Failed to get existing workspaces: Error retrieving keys for Storage Account "examplestorageacct": storage.AccountsClient#ListKeys: Failure responding to request: StatusCode=404 -- Original Error: autorest/azure: Service returned an error. Status=404 Code="ResourceGroupNotFound" Message="Resource group 'RGWorkshopUserName' could not be found." but I want to create it
```

<p align="center">
    <img width="990" alt="image" src="https://github.com/user-attachments/assets/14c0a4a1-4209-4c46-8a72-8132f6dbbcec" />
</p>

## Resource Not Found

> Please ensure you create your storage account and container for backend before running the configuration and deployment. This error occurs because the specified storage account does not exist.

```
Error: Failed to get existing workspaces: Error retrieving keys for Storage Account "examplestorageacct": storage.AccountsClient#ListKeys: Failure responding to request: StatusCode=404 -- Original Error: autorest/azure: Service returned an error. Status=404 Code="ResourceNotFound" Message="The Resource 'Microsoft.Storage/storageAccounts/examplestorageacct' under resource group 'RGWorkshopUserName' was not found. For more details please go to https://aka.ms/ARMResourceNotFoundFix"
```

<p align="center">
    <img width="990" alt="image" src="https://github.com/user-attachments/assets/6c392d1e-32c5-4929-aaf7-6cdb853cf77d" />
</p>

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
