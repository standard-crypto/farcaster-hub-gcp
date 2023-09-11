terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.40.1"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


provider "grafana" {
  alias = "farcaster_stack"

  url  = grafana_cloud_stack.farcaster_stack.url
  auth = grafana_cloud_stack_service_account_token.cloud_sa.key
}
