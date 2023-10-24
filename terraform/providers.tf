provider "google" {
  project = var.project-id
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project-id
  region  = var.region
  zone    = var.zone
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

provider "grafana" {
  alias = "cloud"
}

provider "github" {}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}