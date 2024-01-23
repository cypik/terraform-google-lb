locals {
  health_check = {
    check_interval_sec  = 1
    healthy_threshold   = 4
    timeout_sec         = 1
    unhealthy_threshold = 5
    port                = 80
    request_path        = ""
    host                = ""
  }
}