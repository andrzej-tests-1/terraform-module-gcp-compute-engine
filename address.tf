resource "google_compute_address" "default" {
  name = "${var.environment}-${local.name}"
}
