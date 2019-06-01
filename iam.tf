resource "google_service_account" "default" {
  account_id = "${var.environment}-${local.name}"
}
