terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.0"
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
