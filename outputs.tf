
output "service_account_key_json" {
  description = "GitHub actions service account key"
  sensitive = true
  value = google_service_account_key.github-actions-key.private_key
}
