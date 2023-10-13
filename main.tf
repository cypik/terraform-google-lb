locals {
  health_check_port = var.health_check["port"]
}

#####==============================================================================
##### A ForwardingRule resource. A ForwardingRule resource specifies which pool of
##### target virtual machines to forward a packet to if it matches the given
##### [IPAddress, IPProtocol, portRange] tuple.
#####==============================================================================
resource "google_compute_forwarding_rule" "default" {
  provider              = google-beta
  project               = var.project
  name                  = var.name
  target                = google_compute_target_pool.default.self_link
  load_balancing_scheme = "EXTERNAL"
  port_range            = var.service_port
  region                = var.region
  ip_address            = var.ip_address
  ip_protocol           = var.ip_protocol
  labels                = var.labels
}

#####==============================================================================
##### Manages a Target Pool within GCE.
#####==============================================================================
resource "google_compute_target_pool" "default" {
  project          = var.project
  name             = var.name
  region           = var.region
  session_affinity = var.session_affinity
  health_checks    = var.disable_health_check ? [] : [google_compute_http_health_check.default[0].self_link]
}

#####==============================================================================
##### An HttpHealthCheck resource. This resource defines a template for how
##### individual VMs should be checked for health, via HTTP.
#####==============================================================================
resource "google_compute_http_health_check" "default" {
  count   = var.disable_health_check ? 0 : 1
  project = var.project
  name    = "${var.name}-hc"

  check_interval_sec  = var.health_check["check_interval_sec"]
  healthy_threshold   = var.health_check["healthy_threshold"]
  timeout_sec         = var.health_check["timeout_sec"]
  unhealthy_threshold = var.health_check["unhealthy_threshold"]

  port         = local.health_check_port == null ? var.service_port : local.health_check_port
  request_path = var.health_check["request_path"]
  host         = var.health_check["host"]
}