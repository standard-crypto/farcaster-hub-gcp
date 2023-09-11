data "google_dns_managed_zone" "dns_zone" {
  name = var.dns_zone_name
}

resource "google_dns_record_set" "graphite_dns_recordset" {
  provider     = google-beta
  managed_zone = data.google_dns_managed_zone.dns_zone.name
  name         = "graphite.${data.google_dns_managed_zone.dns_zone.dns_name}"
  type         = "A"
  rrdatas      = [google_compute_address.graphite_ip.address]
  ttl          = 86400
}
