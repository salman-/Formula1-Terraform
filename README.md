# basic-price-predictor

Steps to create a IAS based on this repository:

1. Create a Active Directory and assign a Service Principal role to using the below command:

`az ad sp create-for-rbac --name "fxpricepredictor" --role contributor --scopes "/subscriptions/YOUR-SUBSCRIPTION-ID/resourceGroups/YOUR-RESOURCE-GROUP-NAME" --sdk-auth`
 
2.Add the `clientId`,`clientSecret`,`subscriptionId` and the `tenantId` to the secrets of your repository.