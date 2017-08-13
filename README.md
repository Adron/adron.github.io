# adron.github.io infrastructure

This is the information for how I've got my Google Cloud resources setup via Terraform. This information is of course, not really something you can run independently of my account, but provides effective examples of what I've gotten setup for my own use.

The datadiluvium.com domain Terraform files are located in the Data Diluvium Project repository under the [infrastructure directory](https://github.com/Adron/datadiluvium/tree/master/infrastructure).

## Executing Terraform

Executing with the variables file (variables file needs to be passed in from secrets directory, see below).

*Secrets Directory/Files/Variables*

To execute `terraform plan`, `terraform apply`, or others, the follow variables need set in environment variables.

*Azure values to set*

*export TF_VAR_subscription_id="to_the_subscription_id"
*export TF_VAR_client_id="to_the_client_id"
*export TF_VAR_client_secret="to_the_secret_aka_password"
*export TF_VAR_tenant_id="to_the_tenant_id"

*AWS values to set*

First install the AWS CLI and have it initialized.

*export TF_VAR_aws_region="to_the_AWS_region"

*GCP values to set*

Download the account.json file and place it in the appropriate directory.
