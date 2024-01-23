output "target_pool" {
  description = "The `self_link` to the target pool resource created."
  value       = google_compute_target_pool.default.self_link
}

output "ip_address" {
  description = "The external ip address of the forwarding rule."
  value       = google_compute_forwarding_rule.default.ip_address
}

output "id" {
  value       = google_compute_forwarding_rule.default.id
  description = " An identifier for the resource with format"
}

output "creation_timestamp" {
  value       = google_compute_forwarding_rule.default.psc_connection_status
  description = "Creation timestamp in RFC3339 text format."
}

output "psc_connection_id" {
  value       = google_compute_forwarding_rule.default.psc_connection_id
  description = "The PSC connection id of the PSC Forwarding Rule."
}

output "psc_connection_status" {
  value       = google_compute_forwarding_rule.default.psc_connection_status
  description = "The PSC connection status of the PSC Forwarding Rule."
}

output "label_fingerprint" {
  value       = google_compute_forwarding_rule.default.label_fingerprint
  description = "The fingerprint used for optimistic locking of this resource. "
}

output "service_name" {
  value       = google_compute_forwarding_rule.default.service_name
  description = " The internal fully qualified service name for this Forwarding Rule. "
}

output "base_forwarding_rule" {
  value       = google_compute_forwarding_rule.default.base_forwarding_rule
  description = "The URL for the corresponding base Forwarding Rule."
}

output "self_link" {
  value       = google_compute_forwarding_rule.default.self_link
  description = "The URI of the created resource."
}

output "health_check_id" {
  value       = google_compute_http_health_check.default[*].id
  description = "An identifier for the resource with format."
}

output "health_check_creation_timestamp" {
  value       = google_compute_http_health_check.default[*].creation_timestamp
  description = "Creation timestamp in RFC3339 text format."
}

output "health_check_self_link" {
  value       = google_compute_http_health_check.default[*].self_link
  description = "The URI of the created resource."
}