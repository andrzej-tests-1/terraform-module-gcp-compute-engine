resource "google_compute_instance" "default" {
  name                      = "${var.environment}-${local.name}"
  machine_type              = "${var.machine_type}"
  zone                      = "${var.zone}"
  allow_stopping_for_update = "true"

  boot_disk {
    initialize_params {
      image = "${var.image}"
      type  = "pd-ssd"
      size  = "10"
    }
  }

  network_interface {
    subnetwork = "${var.subnetwork}"

    access_config {
      nat_ip = "${google_compute_address.default.address}"
    }
  }

  service_account {
    email = "${google_service_account.default.email}"

    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  metadata = {
    sshKeys = "${var.ssh_user}:${file("~/.ssh/id_rsa.pub")}"
  }

  tags = "${concat([var.role], var.tags)}"

  lifecycle {
    ignore_changes = [
      "metadata.sshKeys",
    ]
  }
}
