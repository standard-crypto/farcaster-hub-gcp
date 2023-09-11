resource "grafana_cloud_stack" "farcaster_stack" {
  name        = var.grafana_cloud_stack_name
  slug        = var.grafana_cloud_stack_name
  description = "Farcaster Hub Metrics"
  region_slug = "us"
}
