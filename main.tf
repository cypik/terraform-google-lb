module "labels" {
  source      = "git::https://github.com/opz0/terraform-gcp-labels.git?ref=v1.0.0"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
}

data "google_client_config" "current" {
}

locals {
  health_check_port = var.health_check["port"]
}

#####==============================================================================
##### A ForwardingRule resource. A ForwardingRule resource specifies which pool of
##### target virtual machines to forward a packet to if it matches the given
##### [IPAddress, IPProtocol, portRange] tuple.
#####==============================================================================
resource "google_compute_forwarding_rule" "default" {
  project               = data.google_client_config.current.project
  name                  = format("%s-rule", module.labels.id)
  target                = google_compute_target_pool.default.self_link
  load_balancing_scheme = "EXTERNAL"
  port_range            = var.port_range
  region                = var.region
  ip_address            = var.ip_address
  ip_protocol           = var.ip_protocol
  labels                = var.labels
}

#####==============================================================================
##### Manages a Target Pool within GCE.
#####==============================================================================
resource "google_compute_target_pool" "default" {
  project          = data.google_client_config.current.project
  name             = format("%s-pool", module.labels.id)
  region           = var.region
  session_affinity = var.session_affinity
  health_checks    = var.disable_health_check ? [] : [google_compute_http_health_check.default[0].self_link]
}

#####==============================================================================
##### An HttpHealthCheck resource. This resource defines a template for how
##### individual VMs should be checked for health, via HTTP.
#####==============================================================================
resource "google_compute_http_health_check" "default" {
  count               = var.disable_health_check ? 0 : 1
  project             = data.google_client_config.current.project
  name                = "${format("%s-health-check", module.labels.id)}-hc"
  check_interval_sec  = var.health_check["check_interval_sec"]
  healthy_threshold   = var.health_check["healthy_threshold"]
  timeout_sec         = var.health_check["timeout_sec"]
  unhealthy_threshold = var.health_check["unhealthy_threshold"]
  port                = local.health_check_port == null ? var.service_port : local.health_check_port
  request_path        = var.health_check["request_path"]
  host                = var.health_check["host"]
}
#tfsec:ignore:google-compute-no-public-ingress
resource "google_compute_firewall" "default-lb-fw" {
  project = data.google_client_config.current.project == "" ? data.google_client_config.current.project : data.google_client_config.current.project
  name    = "${format("%s-firewall", module.labels.id)}-vm-service"
  network = var.network

  allow {
    protocol = lower(var.ip_protocol)
    ports    = [var.service_port]
  }

  source_ranges           = var.allowed_ips
  target_tags             = var.target_tags
  target_service_accounts = var.target_service_accounts
}
#tfsec:ignore:google-compute-no-public-ingress
resource "google_compute_firewall" "default-hc-fw" {
  count   = var.disable_health_check ? 0 : 1
  project = data.google_client_config.current.project == "" ? data.google_client_config.current.project : data.google_client_config.current.project
  name    = "${format("%s-firewall", module.labels.id)}-hc"
  network = var.network

  allow {
    protocol = "tcp"
    ports    = [local.health_check_port == null ? 80 : local.health_check_port]
  }
  source_ranges = ["35.191.0.0/16", "209.85.152.0/22", "209.85.204.0/22"]

  target_tags             = var.target_tags
  target_service_accounts = var.target_service_accounts
}