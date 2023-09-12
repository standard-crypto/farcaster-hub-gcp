module "graphite" {
  source        = "./modules/graphite"
  project_id    = var.project-id
  region        = var.region
  dns_zone_name = google_dns_managed_zone.dns-zone.name
}
