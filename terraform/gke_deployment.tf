locals {
  app-name = "${var.name}-app"
}

resource "kubernetes_deployment" "farcaster" {
  metadata {
    name = var.name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app" = local.app-name
      }
    }
    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          app = local.app-name
        }
      }
      spec {
        container {
          image = local.image
          name  = "${var.name}-image"
          volume_mount {
            name       = var.name
            mount_path = "/hubble/apps/hubble/.rocks"
          }
          port {
            name           = "hubble-gossip"
            protocol       = "TCP"
            container_port = 2282
          }
          port {
            name           = "hubble-rpc"
            protocol       = "TCP"
            container_port = 2283
          }
          env {
            name  = "HUBBLE_NAME"
            value = var.hubble-name
          }
          env {
            name  = "HUB_HOSTNAME"
            value = google_dns_record_set.dot-vc-farcaster-hub-dns-recordset.name
          }
          env {
            name  = "HUB_IP"
            value = google_compute_address.farcaster-hub-ip.address
          }
          env {
            name = "ETH_RPC_URL"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.eth-rpc-url.metadata[0].name
                key  = "url"
              }
            }
          }
          env {
            name = "IDENTITY_B64"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.peer-id-b64.metadata[0].name
                key  = "identity"
              }
            }
          }
        }
        volume {
          name = var.name
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.farcaster.metadata[0].name
          }
        }
      }
    }
  }
  timeouts {
    create = "5m"
    update = "5m"
  }
}

resource "kubernetes_service" "farcaster" {
  metadata {
    name = var.name
    annotations = {
      "cloud.google.com/network-tier" = "Standard"
    }
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = local.app-name
    }
    port {
      name        = "hubble-gossip"
      protocol    = "TCP"
      port        = 2282
      target_port = 2282
    }
    port {
      name        = "hubble-rpc"
      protocol    = "TCP"
      port        = 2283
      target_port = 2283
    }
    load_balancer_ip = google_compute_address.farcaster-hub-ip.address
  }
}
