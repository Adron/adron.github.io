resource "google_compute_network" "worker-space" {
  name = "worker-space"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default-us-east1" {
  name = "worker-space-default"
  ip_cidr_range = "10.128.0.0/20"
  network = "${google_compute_network.worker-space.self_link}"
  region = "us-central1"
}
