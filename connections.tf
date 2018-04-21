provider "google" {
  credentials = "${file("../secrets/account.json")}"
  project     = "new-universes"
  region      = "us-west1"
}
