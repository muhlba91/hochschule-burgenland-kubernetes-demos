resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "data_bucket" {
  name          = "demo-bucket-${random_id.bucket_suffix.hex}"
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "gcs_reader_writer" {
  bucket = google_storage_bucket.data_bucket.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.gcs_reader.email}"
}
