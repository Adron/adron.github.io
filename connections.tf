# Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../secrets/account.json")}"
  project     = "that-big-universe"
  region = "us-west1"
}

provider "azurerm" {
  subscription_id =
  client_id       =
  client_secret   =
  tenant_id       = 
}

provider "aws" {
  region = "us-west-2"
}
