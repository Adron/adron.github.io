resource "google_compute_network" "production-space" {
  name = "production-space"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "worker-us-west1" {
  name = "production-space"
  ip_cidr_range = "10.138.0.0/18"
  network = "${google_compute_network.production-space.self_link}"
  region = "us-west1"
}

resource "google_compute_network" "developer-space" {
  name = "developer-space"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "developer-us-west1" {
  name = "developer-space"
  ip_cidr_range = "10.140.0.0/20"
  network = "${google_compute_network.developer-space.self_link}"
  region = "us-west1"
}

