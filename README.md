# terraform-gcp-lb
# Google Cloud Infrastructure Provisioning with Terraform
## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [License](#license)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create lb .
## Usage
To use this module, you should have Terraform installed and configured for GCP. This module provides the necessary Terraform configuration for creating GCP resources, and you can customize the inputs as needed. Below is an example of how to use this module:
# Example: load-balancer
```hcl
module "load_balancer" {
  source                  = "git::https://github.com/cypik/terraform-gcp-lb.git?ref=v1.0.0"
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

## Module Inputs

- 'name'  : The name of the service account.
- 'environment': The environment type.
- 'project_id' : The GCP project ID.
- 'region': A reference to the region where the regional forwarding rule resides.
- 'port_range': IThis field can only be used:
- 'network' : This field is not used for external load balancing.
- 'health_check' : List of zero or one health check name or self_link.
- 'target_service_accounts' : A list of service accounts indicating

## Module Outputs
Each module may have specific outputs. You can retrieve these outputs by referencing the module in your Terraform configuration.

- 'id' : An identifier for the resource with format
- 'ip_address' : IP address for which this forwarding rule accepts traffic.
- 'self_link': The URI of the created resource.
- 'creation_timestamp' : Creation timestamp in RFC3339 text format.
- 'psc_connection_status': Self link of the keyring.
- 'psc_connection_id': The PSC connection id of the PSC Forwarding Rule.
- 'health_check_id' : An identifier for the resource with format
- 'health_check_creation_timestamp' :  Creation timestamp in RFC3339 text format.
- 'service_name' : The internal fully qualified service name for this Forwarding Rule.

## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/cypik/terraform-gcp-lb/tree/master/examples) directory within this repository.

## Author
Your Name Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/cypik/terraform-gcp-lb/blob/master/LICENSE) file for details.
