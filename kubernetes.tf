resource "google_container_cluster" "primary" {
  name               = "kuby-domicile"
  network = "${google_compute_network.production-space.self_link}"
  subnetwork = "${google_compute_subnetwork.production-us-west1.self_link}"
  zone               = "${var.defaultzone}"
  initial_node_count = 1

  additional_zones = [
    "us-west1-b",
    "us-west1-c",
  ]

  master_auth {
    username = "${var.username}"
    password = "${var.password}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}

output "cluster_username" {
  value = "${google_container_cluster.primary.master_auth.0.username}"
}

output "cluster_password" {
  value = "${google_container_cluster.primary.master_auth.0.password}"
}

output "endpoint" {
  value = "${google_container_cluster.primary.endpoint}"
}

output "instance_group_urls" {
  value = "${google_container_cluster.primary.instance_group_urls}"
}

output "node_config" {
  value = "${google_container_cluster.primary.node_config}"
}

output "node_pools" {
  value = "${google_container_cluster.primary.node_pool}"
}

output "gcp_ssh_command" {
  value = "ssh ${var.username}@${google_container_cluster.primary.endpoint}"
}

output "gcp_cluster_name" {
  value = "${google_container_cluster.primary.name}"
}

output "gcp_kubectl_command" {
  value = ""
}
