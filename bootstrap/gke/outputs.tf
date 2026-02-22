output "project_id" {
  value       = var.project_id
  description = "Project ID where the cluster is deployed"
}
output "zone" {
  value       = var.zone
  description = "Zone where the cluster is deployed"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.demo.name
  description = "Cluster Name"
}
