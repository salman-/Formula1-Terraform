# Formula1- Infrastructure

The results of Formula1 races have been constantly publishing in the [https://ergast.com/mrd/](https://ergast.com/mrd/) and in this poject we complete the data-engineering process for these data.

## Three main repositories

The [Formula1-Terraform](https://github.com/salman-/Formula1-Terraform), [Formula1-Databricks](https://github.com/salman-/Formula1-Databricks) and [Formula1-DataFactory](https://github.com/salman-/Formula1-DataFactory) are three repositories which are used to clean the [Formula1 data](https://ergast.com/mrd/). 
The **Formula1-Terraform** repository only creates the needed infrastructures in the Azure portal. The **Formula1-DataFactory** contains pipeline which cleans the data and the **Formula1-Databricks** contains the Databricks notebooks which ingest data and load them into the database. 

## Technologies used for the project

| Technology           | Version    |
|--------------------- |------------|
| Terraform            | v1.2.5     | 
| Provider: azurerm    | v3.31.0    |
| Pycharm              | 2022.3     |

## How to run this code ?

Here are steps to create the needed infrastructure using this repository:

1. Create a Service Principal with role `contributor` in the `Subscription` level using the below command and make sure you keep the clientSecret and the other important data:

`az ad sp create-for-rbac --name "formulaeins" --role contributor --scopes "/subscriptions/YOUR-SUBSCRIPTION-ID/resourceGroups/YOUR-RESOURCE-GROUP-NAME" --sdk-auth`

2. Add all needed secrets of pipeline into repository's secret (`Setting -> Secrets -> Actions`). These secrets are:
 ```
 DATABASE_USERNAME,
 DATABASE_PASSWORD,
 VIRTUAL_MACHINE_USERNAME,
 VIRTUAL_MACHINE_PASSWORD,
 ARM_CLIENT_ID,
 ARM_CLIENT_SECRET,
 ARM_SUBSCRIPTION_ID,
 ARM_TENANT_ID`
```

3. This project works by **remote state**. Before you run the project for the first time, you should *manually create a resource-group and storage-account*. Call the storage-account `formuleinsstorage` and it should contain one container which is called `stateholder`. If you keep this storage-account in the same resource group which contains all the other infrastructres, then you need to import the state of these two resources in the next steps, otherwise there is no need to import the states of them.

4. Clone the repository.

5. Run the project by `terraform init` and `terraform apply`. Note the project will fails for the first time, in case the `formuleinsstorage` is in the same resource-group of all other resources.

6. Import the state of resource-group and storage-account into the state file using the below commands:

```
terraform import azurerm_resource_group.main_resource_group "/subscriptions/YOUR-SUBSCRIPTIONID/RG-Terraform-on-Azure"

terraform import  module.storage_account.azurerm_storage_account.storage_account "/subscriptions/YOUR-SUBSCRIPTIONID/resourceGroups/RG-Terraform-on-Azure/providers/Microsoft.Storage/storageAccounts/formuleinsstorage"
```
Please note you only need to import these states only once.

7. After your first successful run, you can always use the existing workflow to add more infrastructure on top of current ones or run the code using the below command:

```
terraform apply -auto-approve -parallelism= NUMBER_OF_CONCURRENT_THREADS -var="pipeline_database_username=DATABASE_USERNAME"
-var="pipeline_database_password=DATABASE_PASSWORD"  -var="pipeline_virtual_machine_username=VIRTUAL_MACHINE_USERNAME" 
-var="pipeline_virtual_machine_password=VIRTUAL_MACHINE_PASSWORD"
-var="client_id_value=ARM_CLIENT_ID"
-var="client_secret_value=ARM_CLIENT_SECRET"
-var="subscription_id_value=ARM_SUBSCRIPTION_ID"
-var="tenant_id_value=ARM_TENANT_ID"
```

## The following picture shows how infrastructures are connected to each other using DataFactory

![Terraform infrastructure](https://user-images.githubusercontent.com/4312244/208876901-fa251ed0-0589-4a28-b380-3345e77df29d.png)


## Problems

1. Sensitive services such as database, storage account should be protected via private link
2. The ip in the `azurerm_mssql_firewall_rule` of database should change dynamically
