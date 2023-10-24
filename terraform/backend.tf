terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = "~> 2.3"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    acme = {
      source  = "vancluever/acme"
      version = "2.17.0"
    }
  }

  backend "remote" {
    organization = "standard-crypto"
    workspaces {
      name = "farcaster-hub"
    }
  }

  required_version = ">= 1.4.2"
}
