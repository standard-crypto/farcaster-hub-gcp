resource "grafana_cloud_stack" "farcaster_stack" {
  provider    = grafana.cloud
  name        = var.grafana_cloud_stack_name
  slug        = var.grafana_cloud_stack_name
  description = "Farcaster Hub Metrics"
  region_slug = "us"
}

resource "grafana_cloud_stack_service_account" "cloud_sa" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.farcaster_stack.slug

  name        = "Terraform service account"
  role        = "Admin"
  is_disabled = false
}

resource "grafana_cloud_stack_service_account_token" "cloud_sa" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.farcaster_stack.slug

  name               = "Terraform service account key"
  service_account_id = grafana_cloud_stack_service_account.cloud_sa.id
}
