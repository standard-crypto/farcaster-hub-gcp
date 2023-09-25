# resource "grafana_data_source" "graphite" {
#   provider   = grafana.farcaster_stack
#   depends_on = [grafana_cloud_stack_service_account_token.cloud_sa]

#   type = "graphite"
#   name = "Graphite"
#   url  = var.graphite_url
# }
