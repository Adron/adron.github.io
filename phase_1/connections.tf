provider "google" {
  credentials = "${file("../../secrets/account.json")}"
  project     = "new-universes"
  region = "us-west1"
}

provider "kubernetes" {
  host     = ""
  username = "${var.username}"
  password = "${var.password}"

  client_certificate     = "${var.client_certificate}"
  client_key             = "${var.client_key}"
  cluster_ca_certificate = "${var.cluster_ca_certificate}"
}
