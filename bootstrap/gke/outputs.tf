output "project_id" {
  value       = var.project_id
  description = "Project ID where the cluster is deployed"
}
output "zone" {
  value       = var.zone
  description = "Zone where the cluster is deployed"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.cluster.name
  description = "Cluster Name"
}

output "kubernetes_cluster_gcloud_command" {
  value       = "KUBECONFIG=./gke.kubeconfig gcloud container clusters get-credentials ${google_container_cluster.cluster.name} --zone ${var.zone} --project ${var.project_id}"
  description = "Command to get credentials for the cluster"
}

output "bucket_name" {
  value       = google_storage_bucket.data_bucket.name
  description = "The name of the GCS bucket"
}
