data "google_container_engine_versions" "versions" {}

resource "google_service_account" "service_account" {
  account_id   = "demo-${var.project_id}"
  display_name = "Service Account for the demo cluster"
}

resource "google_container_node_pool" "node_pool" {
  name_prefix    = "demo-"
  cluster        = google_container_cluster.cluster.name
  location       = var.zone
  node_locations = [var.zone]

  version            = data.google_container_engine_versions.versions.release_channel_default_version["STABLE"]
  initial_node_count = 1
  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  node_config {
    spot         = true
    machine_type = "e2-standard-2"

    boot_disk {
      disk_type = "pd-balanced"
      size_gb   = 25
    }

    service_account = google_service_account.service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    labels = {
      role = "worker"
    }
  }
}
