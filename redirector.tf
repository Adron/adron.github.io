# Create a new instance
resource "google_compute_instance" "redirector" {
  name = "redirector"
  machine_type = "f1-micro"
  tags = [
    "http-server",
    "https-server"]
  zone = "us-central1-b"

  disk {
    image = "redirector-1471078377"
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = "${google_compute_address.redirector.address}"
    }
  }

  //  provisioner "file" {
  //    source = "scripts/run-remote.sh"
  //    destination = "run-remote.sh"
  //    connection {
  //      type = "ssh"
  //      user = "adron"
  //      private_key = "${file("~/.ssh/google_compute_engine")}"
  //    }
//  }
//
  //  provisioner "remote-exec" {
  //    inline = [
  //      "chmod +x run-remote.sh",
  //      "./run-remote.sh"
  //    ]
  //    connection {
  //      type = "ssh"
  //      user = "adron"
  //      private_key = "${file("~/.ssh/google_compute_engine")}"
//    }
//  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}