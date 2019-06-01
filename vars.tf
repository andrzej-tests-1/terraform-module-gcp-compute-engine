variable "role" {
  description = "Role of this gce instance"
  type        = "string"
}

variable "zone" {
  description = "The zone that the instance should be created in"
  type        = "string"
}

variable "environment" {
  description = "Name of environment within instance will be created"
  type        = "string"
}

variable "network" {
  description = "The name of the network to attach interfaces to"
  type        = "string"
}

variable "subnetwork" {
  description = "The name of the subnetwork to attach interfaces to"
  type        = "string"
}

variable "machine_type" {
  description = "Machine type"
  type        = "string"
  default     = "n1-standard-1"
}

variable "tags" {
  description = "Tags used for instance and firewall rules"
  type        = "list"

  default = [
    "allow-ssh",
  ]
}

variable "ssh_user" {
  description = "Your ssh public key (~/.ssh/id_rsa.pub) will be connected with this user"
  type        = "string"
  default     = "root"
}

variable "image" {
  description = "Image which will be used for boot this instance"
  type        = "string"
  default     = "ubuntu-1804-bionic-v20190514"
}
