# Formula1- Infrastructure

Steps to create a IAS (Infrastructure As Service) based on this repository:

1. Create a Active Directory and assign a Service Principal role to using the below command:

`az ad sp create-for-rbac --name "fxpricepredictor" --role contributor --scopes "/subscriptions/YOUR-SUBSCRIPTION-ID/resourceGroups/YOUR-RESOURCE-GROUP-NAME" --sdk-auth`
 
2.Add the `clientId`,`clientSecret`,`subscriptionId` and the `tenantId` to the secrets of your repository.



## Problems

1. Services such as keyvault or private link which need to have a unique name cannot be automated
2. Sensitive services such as database, storage account should be protected via private link
