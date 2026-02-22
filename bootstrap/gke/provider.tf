provider "google" {
  # set environment variable GOOGLE_APPLICATION_CREDENTIALS to the path of your service account key file (you can store it in this directory named gcp-sa-key.json which is gitignored)

  project = var.project_id
  region  = var.region
  zone    = var.zone

  default_labels = {
    purpose = "demo"
    env     = "classroom"
  }
}
