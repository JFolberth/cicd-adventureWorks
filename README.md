# cicd-adventureWorks

## About
This project is used for demonstration purposes. It is designed to show how to leverage [SDK-style SQL Projects](https://learn.microsoft.com/en-us/azure-data-studio/extensions/sql-database-project-extension-sdk-style-projects) and incorporate that into a Multi Stage YAML CI/CD process leveraging [TheYamlPipelineOne](https://github.com/JFolberth/TheYAMLPipelineOne) for templating.

## CI/CD Steps
### CI
The CI steps will run a `dotnet build` against the SQL project to generate a .dacpac file. This file will then be published as a pipeline artifact for the deployment stages to leverage.

Additionally the CI will also take a list of folders and their contents which should be published as artifacts. These artifacts can be used in later stages. At this time we are not using them just calling out how one could.

### CD
The deployment stages will take the pipeline artifacts published in the CI steps and deploy the .dapac file using the [SqlAzureDacpacDeployment@1 task](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/sql-azure-dacpac-deployment-v1?view=azure-pipelines)

## Pre-Reqs
For this sample to work one must already have a SQL Database and Server already deployed into Azure. The server must have Entra ID authentication enabled.

Additionally the Azure DevOps instance will already have a service connection which is a member of the group or the SQL Server Entra ID administrator. This is required for us to leverage Service Principle authentication for the database deployment.

## Repo Structure
### src
This folder is the source code for the SQL Project. It is built via a `Create Project from Database` to an already existing Azure SQL Database with the Adventure Works sample schema and data deployed to it.

### security
An empty folder to demonstrate how one could have additional sql scripts run as part of the CI/CD process.

### YAML
#### azure-pipeline-expanded.yml
This is the fully expanded YAML definition of the pipeline. I have included this as an example for those that just want to quickly "take and run" with the pipeline. One would just need to update:
- SQL Server Name
- SQL Database Name
- Service Connection Name

#### azure-pipeline.yml
This is the pipeline this project is connected to. It will fully expand leveraging the following stage templates:
- [dotnet_sql_build_stage.yml](https://github.com/JFolberth/TheYAMLPipelineOne/blob/main/stages/dotnet_sql_build_stage.yml)
- [dacpac_deploy_stage.yml](https://github.com/JFolberth/TheYAMLPipelineOne/blob/main/stages/dacpac_deploy_stage.yml)

## Limitations
Currently it has been discovered that the [SqlAzureDacpacDeployment@1 task does not recognize the Pipeline.Workspace predefined variable](https://github.com/MicrosoftDocs/azure-devops-yaml-schema/issues/285#issuecomment-1880596283)

Additionally the [SqlAzureDacpacDeployment@1 task seems to break if the default 'AutoDetect' value is provided for IPDetection Method]