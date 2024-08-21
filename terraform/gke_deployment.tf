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
        security_context {
          fs_group = "1000" # user 'node'
        }
        container {
          image = "farcasterxyz/hubble:1.14.5"
          name  = "${var.name}-container"
          security_context {
            allow_privilege_escalation = false
            run_as_user                = "1000"
          }
          resources {
            requests = {
              memory = "32Gi"
            }
          }
          volume_mount {
            name       = var.name
            mount_path = "/home/node/app/apps/hubble/.rocks"
          }
          port {
            name           = "hubble-http"
            protocol       = "TCP"
            container_port = 2281
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
            name  = "HUB_NETWORK"
            value = var.hubble-network
          }
          env {
            name  = "BOOTSTRAP_NODE"
            value = "/dns/nemes.farcaster.xyz/tcp/2282"
          }
          env {
            name = "ETH_MAINNET_RPC_URL"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.eth-mainnet-rpc-url.metadata[0].name
                key  = "url"
              }
            }
          }
          env {
            name = "OPTIMISM_L2_RPC_URL"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.optimism-l2-rpc-url.metadata[0].name
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
          command = ["yarn", "start"]
          args = [
            "--eth-mainnet-rpc-url", "$(ETH_MAINNET_RPC_URL)",
            "--l2-rpc-url", "$(OPTIMISM_L2_RPC_URL)",
            "--announce-server-name", "$(HUB_HOSTNAME)",
            "--announce-ip", "$(HUB_IP)",
            "--network", "$(HUB_NETWORK)",
            "--http-api-port", "2281",
            "--gossip-port", "2282",
            "--rpc-port", "2283",
            "--ip", "0.0.0.0",
            "--db-name", "farcaster",
            "--hub-operator-fid", var.hubble-operator-fid,
            "--statsd-metrics-server", module.graphite.statsd_host
          ]
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
      name        = "hubble-http"
      protocol    = "TCP"
      port        = 2281
      target_port = 2281
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
  }
}

resource "kubernetes_manifest" "farcaster-vertical-autoscaler" {
  manifest = {
    apiVersion = "autoscaling.k8s.io/v1"
    kind       = "VerticalPodAutoscaler"
    metadata = {
      name      = "${var.name}-vertical-autoscaler"
      namespace = "default"
    }
    spec = {
      targetRef = {
        apiVersion = "apps/v1"
        kind       = "Deployment"
        name       = kubernetes_deployment.farcaster.metadata[0].name
      }
      updatePolicy = {
        # specifies that the Vertical Pod Autoscaler controller can delete a Pod, 
        # adjust the CPU and memory requests, and then start a new Pod.
        updateMode  = "Auto"
        minReplicas = 1
      }
      resourcePolicy = {
        containerPolicies = [{
          containerName = "${var.name}-container"
          maxAllowed = {
            memory = "56Gi"
          }
        }]
      }
    }
  }
}
