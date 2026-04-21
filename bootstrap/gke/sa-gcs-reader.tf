resource "google_service_account" "gcs_reader" {
  account_id   = "gcs-reader"
  display_name = "GCS Reader Service Account for Workload Identity"
  project      = var.project_id
}

resource "google_project_iam_member" "gcs_reader_storage_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gcs_reader.email}"
}

resource "google_project_iam_member" "gcs_reader_project_viewer" {
  project = var.project_id
  role    = "roles/storage.viewer"
  member  = "serviceAccount:${google_service_account.gcs_reader.email}"
}

resource "google_service_account_iam_member" "gcs_reader_workload_identity" {
  service_account_id = google_service_account.gcs_reader.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.k8s_namespace}/${var.k8s_service_account_name}]"
}
