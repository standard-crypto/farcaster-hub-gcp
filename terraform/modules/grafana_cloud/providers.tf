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
  auth = grafana_cloud_stack_service_account_token.cloud_sa.key
}
