provider "google" {
  # authenticates with application default credentials: gcloud auth application-default login

  project = var.project_id
  region  = var.region
  zone    = var.zone

  default_labels = {
    purpose = "demo"
    env     = "classroom"
  }
}
