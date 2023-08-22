locals {
  grpc-exporter-app-name   = "grpc-exporter"
}

resource "kubernetes_deployment" "grpc-exporter" {
  metadata {
    name = local.grpc-exporter-app-name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app" = local.grpc-exporter-app-name
      }
    }
    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          app = local.grpc-exporter-app-name
        }
      }
      spec {
        container {
          image = local.grpc-exporter-image
          name  = "${local.grpc-exporter-app-name}-image"
          env {
            name  = "FC_HOSTNAME"
            value = kubernetes_service.farcaster.metadata[0].name
          }
          port {
            name           = "prom-stats"
            protocol       = "TCP"
            container_port = 9090
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "grpc-exporter" {
  metadata {
    name = local.grpc-exporter-app-name
  }
  spec {
    type = "ClusterIP"
    selector = {
      app = local.grpc-exporter-app-name
    }
    port {
      name        = "prom-stats"
      protocol    = "TCP"
      port        = 9090
      target_port = 9090
    }
  }
}