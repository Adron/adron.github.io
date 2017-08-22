First step, get the Azure CLI.

https://github.com/Azure/azure-cli

Login `az login` and use the browser trick thing they've setup akin to GCP gcloud's.

Docs for CLI 2.0 > https://docs.microsoft.com/en-us/cli/azure/overview
Docs Reference v2.0 > https://docs.microsoft.com/en-us/cli/azure/

Setup for Terraform > https://www.terraform.io/docs/providers/azurerm/

All the info for...

provider "azurerm" {
  subscription_id = "..."
  client_id       = "..."
  client_secret   = "..."
  tenant_id       = "..."
}

Best to add via environment variables or such. To get the specific values they can be retrieved by the following commands.

az account list

[
  {
    "cloudName": "AzureCloud",
    "id": "a2c16d7f-asdf-9b4a-f5c646c1fa9a",
    "isDefault": true,
    "name": "Free Trial",
    "state": "Enabled",
    "tenantId": "601829dc-asdf-4bee-asdf-200ea19aa336",
    "user": {
      "name": "adron@blarghyargh.com",
      "type": "user"
    }
  }
]

id == subscription_id

Create the subscription service principal.

`az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"`

or if it exists...

`az ad sp `

{
  "appId": "00000000-0000-0000-0000-000000000000",
  "displayName": "azure-cli-2017-06-05-10-41-15",
  "name": "http://azure-cli-2017-06-05-10-41-15",
  "password": "0000-0000-0000-0000-000000000000",
  "tenant": "00000000-0000-0000-0000-000000000000"
}

appId == client_id
password == client_secret
tenant == tenant_id

Sample references used from here too > https://github.com/paulbouwer/terraform-azure-quickstarts-samples/blob/master/101-acs-kubernetes/variables.tf

