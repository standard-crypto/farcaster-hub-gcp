variable "project-id" {
  type        = string
  description = "GCP Project ID"
  default     = "sc-farcaster"
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "zone" {
  type    = string
  default = "us-west1-b"
}

// A string that will prefix most names of resources created by terraform
variable "name" {
  type    = string
  default = "farcaster-hub"
}

// The name that the hub will present to connected clients
variable "hubble-name" {
  type    = string
  default = "Standard Crypto"
}

// ID of the network the hub will run on
variable "hubble-network" {
  type    = number
  default = 1 # mainnet
}
