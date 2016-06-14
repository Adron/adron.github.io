# Create a new instance
resource "google_compute_instance" "lone-elastic" {
  name = "lone-elastic"
  machine_type = "f1-micro"
  tags = [
    "elastic"]
  zone = "us-central1-b"

  disk {
    image = "ubuntu-1404-trusty-v20160406"
  }

  disk {
    disk = "${google_compute_disk.elastic-storage.name}"
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = "${google_compute_address.addy-lonestar-service.address}"
    }
  }

  provisioner "file" {
    source = "scripts/elastic.sh"
    destination = "elastic.sh"
    connection {
      type = "ssh"
      user = "adron"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x elastic.sh",
      "./elastic.sh"
    ]
    connection {
      type = "ssh"
      user = "adron"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}