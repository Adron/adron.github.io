//resource "google_container_cluster" "primary" {
//  name               = "kubyhouse"
//  zone               = "us-west1-a"
//  initial_node_count = "${var.gcp_cluster_count}"
//
//  additional_zones = [
//    "us-west1-b",
//    "us-west1-c",
//  ]
//
//  master_auth {
//    username = "${var.linux_admin_username}"
//    password = "${var.linux_admin_password}}"
//  }
//
//  node_config {
//    oauth_scopes = [
//      "https://www.googleapis.com/auth/compute",
//      "https://www.googleapis.com/auth/devstorage.read_only",
//      "https://www.googleapis.com/auth/logging.write",
//      "https://www.googleapis.com/auth/monitoring",
//    ]
//
//    labels {
//      foo = "bar"
//    }
//
//    tags = ["foo", "bar"]
//  }
//}