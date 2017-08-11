# Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../secrets/account.json")}"
  project     = "that-big-universe"
  region = "us-west1"
}

provider "azurerm" {
  subscription_id = "${SUBSCRIPTION_ID}"
  // client_id       = "${CLIENT_ID}"
  // client_secret   = "${CLIENT_SECRET}"
  // tenant_id       = "${TENANT_ID}"
}

provider "aws" {
  region = "us-west-2"
}
