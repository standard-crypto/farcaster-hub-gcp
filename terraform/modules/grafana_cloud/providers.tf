terraform {
  required_providers {
    grafana = {
      source                = "grafana/grafana"
      configuration_aliases = [grafana.cloud]
    }
    github = {
      source = "integrations/github"
    }
  }
}

provider "grafana" {
  alias = "farcaster_stack"

  url  = grafana_cloud_stack.farcaster_stack.url
  auth = var.grafana_cloud_api_key
}
