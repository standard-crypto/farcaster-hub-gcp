resource "kubernetes_secret" "eth-rpc-url" {
  metadata {
    name = "${var.name}-eth-rpc-url"
  }
  data = {
    "url" = "PLACEHOLDER"
  }
  lifecycle {
    // Do not overwrite with the PLACEHOLDER value
    ignore_changes = all
  }
}

resource "kubernetes_secret" "eth-mainnet-rpc-url" {
  metadata {
    name = "${var.name}-eth-mainnet-rpc-url"
  }
  data = {
    "url" = "PLACEHOLDER"
  }
  lifecycle {
    // Do not overwrite with the PLACEHOLDER value
    ignore_changes = all
  }
}

resource "kubernetes_secret" "peer-id-b64" {
  metadata {
    name = "${var.name}-peer-id-b64"
  }
  data = {
    "identity" = "PLACEHOLDER"
  }
  lifecycle {
    // Do not overwrite with the PLACEHOLDER value
    ignore_changes = all
  }
}

resource "kubernetes_secret" "grafana-api-key" {
  metadata {
    name = "grafana-api-key"
  }
  data = {
    "url" = "PLACEHOLDER"
  }
  lifecycle {
    // Do not overwrite with the PLACEHOLDER value
    ignore_changes = all
  }
}
