# Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../secrets/account.json")}"
  project     = "that-big-universe"
  region = "us-west1"
}