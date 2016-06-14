resource "google_compute_firewall" "elastic-nginx-port" {
  name = "elastic-nginx-port"
  network = "${google_compute_network.worker-space.name}"

  allow {
    protocol = "tcp"
    ports = [
      "80",
      "9200"]
  }

  source_tags = [
    "web",
    "elastic"]
}