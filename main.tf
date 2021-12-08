locals {
  timestamp = formatdate("YYMMDDhhmmss", timestamp())
  root_dir  = abspath("../")
}

# Create bucket that will host the source code
resource "google_storage_bucket" "function_bucket" {
  name     = "${var.project}-function"
  location = var.bucket_location
}

# Compress source code
data "archive_file" "source" {
  type        = "zip"
  source_dir  = var.filename
  output_path = "/tmp/function-${local.timestamp}.zip"
}

# Add source code zip to bucket
resource "google_storage_bucket_object" "zip" {
  # Append file MD5 to force bucket to be recreated
  name   = "source.zip#${data.archive_file.source.output_md5}"
  bucket = google_storage_bucket.function_bucket.name
  source = data.archive_file.source.output_path
}

resource "google_service_account" "service_account" {
  account_id   = "cloud-function-invoker"
  display_name = "Cloud Function Tutorial Invoker Service Account"
}

# Create IAM entry so all users can invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}

# Create Cloud Function
resource "google_cloudfunctions_function" "function" {
  name    = var.function_name
  runtime = var.runtime

  available_memory_mb   = var.available_memory_mb
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.zip.name
  trigger_http          = true
  entry_point           = var.function_entry_point
}
