module "grafana_cloud" {
  source                   = "./modules/grafana_cloud"
  grafana_cloud_stack_name = var.grafana_cloud_stack_name
}
