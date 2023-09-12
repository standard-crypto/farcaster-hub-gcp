variable "grafana_cloud_stack_name" {
  type        = string
  description = "Name of the stack (One word. Only lowercase letters and numbers allowed. Must start with a letter. No dots, dashes, underscores, or spaces.)"
}

variable "graphite_url" {
  type        = string
  description = "URL of the hub's graphite instance"
}
