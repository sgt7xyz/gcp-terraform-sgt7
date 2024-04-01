resource "google_service_account" "github-actions" {
  project      = var.project
  account_id   = "github-actions"
  display_name = "GitHub Actions Service Account"
  description  = "Service account for GitHub connecting to GCP Artifact Registry"
}

resource "google_project_iam_member" "github-actions-role-artifactregistry-admin" {
  project = var.project
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.github-actions.email}"
  depends_on = [google_service_account.github-actions]
}

resource "google_project_iam_member" "github-actions-role-containerregistry-admin" {
  project = var.project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.github-actions.email}"
  depends_on = [google_service_account.github-actions]
}

resource "google_service_account_key" "github-actions-key" {
  service_account_id = google_service_account.github-actions.name
  depends_on         = [google_service_account.github-actions]
}