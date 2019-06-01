# terraform-module-gcp-compute-engine

Terraform GCE specific configuration.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| environment | Name of environment within instance will be created | string | n/a | yes |
| network | The name of the network to attach interfaces to | string | n/a | yes |
| role | Role of this gce instance | string | n/a | yes |
| subnetwork | The name of the subnetwork to attach interfaces to | string | n/a | yes |
| zone | The zone that the instance should be created in | string | n/a | yes |
| image | Image which will be used for boot this instance | string | `"ubuntu-1804-bionic-v20190514"` | no |
| machine\_type | Machine type | string | `"n1-standard-1"` | no |
| ssh\_user | Your ssh public key (~/.ssh/id_rsa.pub) will be connected with this user | string | `"root"` | no |
| tags | Tags used for instance and firewall rules | list | `<list>` | no |

## Example

```hcl-terraform
module "jenkins-main" {
  source = "git@github.com:/andrzej-tests-1/terraform-module-gcp-compute-engine.git?ref=x.y.z"

  role        = "jenkins"
  environment = "${var.environment}"
  zone        = "${local.zone}"
  network     = "${module.network.network}"
  subnetwork  = "${module.network.subnetwork}"
}
```
