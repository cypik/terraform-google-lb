# Terraform-gcp-lb
# Terraform Google Cloud Lb Module
## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [License](#license)
- [Author](#author)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create Load-Balancer.
## Usage
To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:
# Example: load-balancer
```hcl
module "load_balancer" {
  source                  = "cypik/lb/google"
  version                 = "1.0.1"
  name                    = "test"
  environment             = "load-balancer"
  region                  = "asia-northeast1"
  port_range              = 80
  network                 = module.vpc.vpc_id
  health_check            = local.health_check
  target_service_accounts = []
}
```
This example demonstrates how to create various GCP resources using the provided modules. Adjust the input values to suit your specific requirements.

## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/cypik/terraform-google-lb/tree/master/example) directory within this repository.

## Author
Your Name Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/cypik/terraform-google-lb/blob/master/LICENSE) file for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50, < 5.11.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.53, < 5.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.50, < 5.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | cypik/labels/google | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.default-hc-fw](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.default-lb-fw](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_forwarding_rule.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule) | resource |
| [google_compute_http_health_check.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_http_health_check) | resource |
| [google_compute_target_pool.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_pool) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_ips"></a> [allowed\_ips](#input\_allowed\_ips) | The IP address ranges which can access the load balancer. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_disable_health_check"></a> [disable\_health\_check](#input\_disable\_health\_check) | Disables the health check on the target pool. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check to determine whether instances are responsive and able to do work | <pre>object({<br>    check_interval_sec  = number<br>    healthy_threshold   = number<br>    timeout_sec         = number<br>    unhealthy_threshold = number<br>    port                = number<br>    request_path        = string<br>    host                = string<br>  })</pre> | <pre>{<br>  "check_interval_sec": null,<br>  "healthy_threshold": null,<br>  "host": null,<br>  "port": null,<br>  "request_path": null,<br>  "timeout_sec": null,<br>  "unhealthy_threshold": null<br>}</pre> | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | IP address of the external load balancer, if empty one will be assigned. | `string` | `null` | no |
| <a name="input_ip_protocol"></a> [ip\_protocol](#input\_ip\_protocol) | The IP protocol for the frontend forwarding rule and firewall rule. TCP, UDP, ESP, AH, SCTP or ICMP. | `string` | `"TCP"` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The labels to attach to resources created by this module. | `map(string)` | `{}` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'cypik'. | `string` | `"cypik"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. Provided by the client when the resource is created. | `string` | `"test"` | no |
| <a name="input_network"></a> [network](#input\_network) | Name of the network to create resources in. | `string` | `"default"` | no |
| <a name="input_port_range"></a> [port\_range](#input\_port\_range) | TCP port your service is listening on. | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region used for GCP resources. | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/cypik/terraform-google-lb"` | no |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | The port for the service. | `number` | `80` | no |
| <a name="input_session_affinity"></a> [session\_affinity](#input\_session\_affinity) | How to distribute load. Options are `NONE`, `CLIENT_IP` and `CLIENT_IP_PROTO` | `string` | `"NONE"` | no |
| <a name="input_target_service_accounts"></a> [target\_service\_accounts](#input\_target\_service\_accounts) | List of target service accounts to allow traffic using firewall rule. | `list(string)` | `null` | no |
| <a name="input_target_tags"></a> [target\_tags](#input\_target\_tags) | List of target tags to allow traffic using firewall rule. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_base_forwarding_rule"></a> [base\_forwarding\_rule](#output\_base\_forwarding\_rule) | The URL for the corresponding base Forwarding Rule. |
| <a name="output_creation_timestamp"></a> [creation\_timestamp](#output\_creation\_timestamp) | Creation timestamp in RFC3339 text format. |
| <a name="output_health_check_creation_timestamp"></a> [health\_check\_creation\_timestamp](#output\_health\_check\_creation\_timestamp) | Creation timestamp in RFC3339 text format. |
| <a name="output_health_check_id"></a> [health\_check\_id](#output\_health\_check\_id) | An identifier for the resource with format. |
| <a name="output_health_check_self_link"></a> [health\_check\_self\_link](#output\_health\_check\_self\_link) | The URI of the created resource. |
| <a name="output_id"></a> [id](#output\_id) | An identifier for the resource with format |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The external ip address of the forwarding rule. |
| <a name="output_label_fingerprint"></a> [label\_fingerprint](#output\_label\_fingerprint) | The fingerprint used for optimistic locking of this resource. |
| <a name="output_psc_connection_id"></a> [psc\_connection\_id](#output\_psc\_connection\_id) | The PSC connection id of the PSC Forwarding Rule. |
| <a name="output_psc_connection_status"></a> [psc\_connection\_status](#output\_psc\_connection\_status) | The PSC connection status of the PSC Forwarding Rule. |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | The internal fully qualified service name for this Forwarding Rule. |
| <a name="output_target_pool"></a> [target\_pool](#output\_target\_pool) | The `self_link` to the target pool resource created. |
<!-- END_TF_DOCS -->