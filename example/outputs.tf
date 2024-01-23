output "load_balancer_default_ip" {
  description = "The external ip address of the forwarding rule for default lb."
  value       = module.load_balancer.ip_address
}

output "target_pool" {
  description = "The `self_link` to the target pool resource created."
  value       = module.instance_template.self_link
}

output "id" {
  value       = module.load_balancer.id
  description = " an identifier for the resource with format"
}

output "creation_timestamp" {
  value       = module.load_balancer.creation_timestamp
  description = "Creation timestamp in RFC3339 text format."
}

output "psc_connection_id" {
  value       = module.load_balancer.psc_connection_id
  description = "The PSC connection id of the PSC Forwarding Rule."
}

output "psc_connection_status" {
  value       = module.load_balancer.psc_connection_status
  description = "The PSC connection status of the PSC Forwarding Rule."
}

output "label_fingerprint" {
  value       = module.load_balancer.label_fingerprint
  description = "The fingerprint used for optimistic locking of this resource. "
}

output "service_name" {
  value       = module.load_balancer.service_name
  description = " The internal fully qualified service name for this Forwarding Rule. "
}

output "base_forwarding_rule" {
  value       = module.load_balancer.base_forwarding_rule
  description = "The URL for the corresponding base Forwarding Rule."
}

output "self_link" {
  value       = module.load_balancer.self_link
  description = "The URI of the created resource."
}

output "health_check_id" {
  value       = module.load_balancer.health_check_id
  description = "An identifier for the resource with format."
}

output "health_check_creation_timestamp" {
  value       = module.load_balancer.health_check_creation_timestamp
  description = "Creation timestamp in RFC3339 text format."
}

output "health_check_self_link" {
  value       = module.load_balancer.health_check_self_link
  description = "The URI of the created resource."
}