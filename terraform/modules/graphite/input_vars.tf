variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  description = "GCP Region"
}

variable "dns_zone_name" {
  type        = string
  description = "Name of the Google Cloud DNS managed zone"
}
