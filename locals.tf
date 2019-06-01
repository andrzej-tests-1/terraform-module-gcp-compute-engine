locals {
  name = "${var.role}-${random_id.default.hex}"
}
