resource "google_compute_firewall" "elastic-nginx-port" {
  name = "elastic-port"
  network = "${google_compute_network.worker-space.name}"

  allow {
    protocol = "tcp"
    ports = ["9200"]
  }

  source_tags = ["elastic"]
}