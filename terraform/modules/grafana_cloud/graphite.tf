resource "grafana_data_source" "graphite" {
  provider = grafana.farcaster_stack
  type     = "graphite"
  name     = "Graphite"
  url      = var.graphite_url
}
