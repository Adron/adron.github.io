resource "google_compute_network" "production-space" {
  name = "production-space"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "production-us-west1" {
  name = "production-space-west1"
  ip_cidr_range = "10.138.0.0/18"
  network = "${google_compute_network.production-space.self_link}"
  region = "us-west1"
}

resource "google_compute_subnetwork" "production-us-central1" {
  name = "production-space-central1"
  ip_cidr_range = "10.127.0.0/20"
  network = "${google_compute_network.production-space.self_link}"
  region = "us-central1"
}

//resource "google_compute_network" "developer-space" {
//  name = "developer-space"
//  auto_create_subnetworks = false
//}
//
//resource "google_compute_subnetwork" "developer-us-west1" {
//  name = "developer-space-west1"
//  ip_cidr_range = "10.140.0.0/20"
//  network = "${google_compute_network.developer-space.self_link}"
//  region = "us-west1"
//}
//
//resource "google_compute_subnetwork" "developer-us-central1" {
//  name = "developer-space-central1"
//  ip_cidr_range = "10.128.0.0/20"
//  network = "${google_compute_network.developer-space.self_link}"
//  region = "us-central1"
//}
