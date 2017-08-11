# Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../secrets/account.json")}"
  project     = "that-big-universe"
  region = "us-west1"
}

provider "azurerm" {
  subscription_id = "a2c16d7f-c792-4c77-9b4a-f5c646c1fa9a"
  client_id       = "2242ef82-d757-49ca-ad3f-ec68e1ec93c9"
  client_secret   = "1fe4ab6c-fb8a-4f76-b492-f02dca3138d4"
  tenant_id       = "601829dc-dae5-4bee-8acd-200ea19aa336"
}

provider "aws" {
  region = "us-west-2"
}
