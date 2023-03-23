locals {
  ip-range-pods-name     = "ip-range-pods"
  ip-range-services-name = "ip-range-services"
  network-name           = "${var.name}-gke-network"
  subnet-name            = "${var.name}-gke-subnet"
  subnet_names           = [for subnet_self_link in module.gcp-network.subnets_self_links : split("/", subnet_self_link)[length(split("/", subnet_self_link)) - 1]]
}

module "gcp-network" {
  source  = "terraform-google-modules/network/google"
  version = ">= 4.0.1"

  project_id   = var.project-id
  network_name = local.network-name

  subnets = [
    {
      subnet_name   = local.subnet-name
      subnet_ip     = "10.0.0.0/17"
      subnet_region = var.region
    }
  ]

  secondary_ranges = {
    "${var.name}-gke-subnet" = [
      {
        range_name    = local.ip-range-pods-name
        ip_cidr_range = "192.168.0.0/18"
      },
      {
        range_name    = local.ip-range-services-name
        ip_cidr_range = "192.168.64.0/18"
      },
    ]
  }
}

resource "google_compute_address" "farcaster-hub-ip" {
  name         = "${var.name}-ip"
  region       = var.region
  network_tier = "STANDARD"
}

resource "google_compute_firewall" "farcaster-hub-firewall" {
  name    = "farcaster-hub-firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["2282", "2283"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.name]
}
