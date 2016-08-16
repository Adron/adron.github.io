# Create a new instance
resource "google_compute_instance" "redirector" {
  name = "redirector"
  machine_type = "f1-micro"
  tags = [
    "http-server",
    "https-server"]
  zone = "us-central1-b"

  disk {
    image = "redirector-1471307522"
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = "${google_compute_address.redirector.address}"
    }
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}
