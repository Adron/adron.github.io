resource "google_compute_network" "worker-space" {
  name = "test"
  auto_create_subnetworks = false
}

