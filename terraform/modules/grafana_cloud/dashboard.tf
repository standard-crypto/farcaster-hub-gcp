
data "github_repository_file" "grafana_dashboard_json" {
  repository = "farcasterxyz/hub-monorepo"
  branch     = "main"
  file       = "apps/hubble/grafana/grafana-dashboard.json"
}

resource "grafana_dashboard" "default_hubble_dashboard" {
  provider = grafana.farcaster_stack

  config_json = data.github_repository_file.grafana_dashboard_json.content
}
