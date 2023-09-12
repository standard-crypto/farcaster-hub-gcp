resource "google_compute_address" "graphite_ip" {
  name         = "graphite-ip"
  region       = var.region
  network_tier = "STANDARD"
}
