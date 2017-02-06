resource "google_compute_disk" "drone" {
  name = "drone-server-sqlite-db"
  type = "pd-ssd"
  zone = "us-west1-a"
  size = "20"
}
