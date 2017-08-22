variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "aws_region" {}

# Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../../secrets/account.json")}"
  project     = "that-big-universe"
  region = "us-west1"
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}
