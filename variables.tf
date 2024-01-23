variable "name" {
  type        = string
  default     = "test"
  description = "Name of the resource. Provided by the client when the resource is created. "
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = "cypik"
  description = "ManagedBy, eg 'cypik'."
}

variable "repository" {
  type        = string
  default     = "https://github.com/cypik/terraform-google-lb"
  description = "Terraform current module repo"
}

variable "network" {
  type        = string
  description = "Name of the network to create resources in."
  default     = "default"
}

variable "target_tags" {
  description = "List of target tags to allow traffic using firewall rule."
  type        = list(string)
  default     = null
}

variable "target_service_accounts" {
  description = "List of target service accounts to allow traffic using firewall rule."
  type        = list(string)
  default     = null
}

variable "allowed_ips" {
  description = "The IP address ranges which can access the load balancer."
  default     = ["0.0.0.0/0"]
  type        = list(string)
}

variable "region" {
  type        = string
  description = "Region used for GCP resources."
}

variable "port_range" {
  type        = number
  description = "TCP port your service is listening on."
}

variable "session_affinity" {
  type        = string
  description = "How to distribute load. Options are `NONE`, `CLIENT_IP` and `CLIENT_IP_PROTO`"
  default     = "NONE"
}

variable "disable_health_check" {
  type        = bool
  description = "Disables the health check on the target pool."
  default     = false
}

variable "health_check" {
  description = "Health check to determine whether instances are responsive and able to do work"
  type = object({
    check_interval_sec  = number
    healthy_threshold   = number
    timeout_sec         = number
    unhealthy_threshold = number
    port                = number
    request_path        = string
    host                = string
  })
  default = {
    check_interval_sec  = null
    healthy_threshold   = null
    timeout_sec         = null
    unhealthy_threshold = null
    port                = null
    request_path        = null
    host                = null
  }
}

variable "ip_address" {
  description = "IP address of the external load balancer, if empty one will be assigned."
  type        = string
  default     = null
}

variable "ip_protocol" {
  description = "The IP protocol for the frontend forwarding rule and firewall rule. TCP, UDP, ESP, AH, SCTP or ICMP."
  type        = string
  default     = "TCP"
}

variable "labels" {
  description = "The labels to attach to resources created by this module."
  default     = {}
  type        = map(string)
}

variable "service_port" {
  description = "The port for the service."
  type        = number
  default     = 80
}