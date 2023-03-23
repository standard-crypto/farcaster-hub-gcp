resource "google_dns_managed_zone" "dns-zone" {
  name     = "farcaster-dns-zone"
  dns_name = "farcaster.standardcryptovc.com."
}

resource "google_dns_managed_zone" "dot-vc-dns-zone" {
  name     = "dot-vc-farcaster-dns-zone"
  dns_name = "farcaster.standardcrypto.vc."
}

resource "google_dns_record_set" "farcaster-hub-dns-recordset" {
  provider     = google-beta
  managed_zone = google_dns_managed_zone.dns-zone.name
  name         = "hub.${google_dns_managed_zone.dns-zone.dns_name}"
  type         = "A"
  rrdatas      = [google_compute_address.farcaster-hub-ip.address]
  ttl          = 86400
}

resource "google_dns_record_set" "dot-vc-farcaster-hub-dns-recordset" {
  provider     = google-beta
  managed_zone = google_dns_managed_zone.dot-vc-dns-zone.name
  name         = "hub.${google_dns_managed_zone.dot-vc-dns-zone.dns_name}"
  type         = "A"
  rrdatas      = [google_compute_address.farcaster-hub-ip.address]
  ttl          = 86400
}
