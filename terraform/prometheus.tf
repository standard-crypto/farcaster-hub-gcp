locals {
  prometheus-app-name    = "prometheus"
  prometheus-secret-name = "prometheus-secrets"
}

resource "kubernetes_cluster_role" "prometheus" {
  metadata {
    name = "prometheus"
  }

  rule {
    api_groups = [""]
    resources  = ["nodes", "nodes/proxy", "services", "endpoints", "pods"]
    verbs      = ["get", "list", "watch"]
  }

  rule {
    api_groups = ["extensions"]
    resources  = ["ingresses"]
    verbs      = ["get", "list", "watch"]
  }

  rule {
    non_resource_urls = ["/metrics"]
    verbs             = ["get"]
  }
}

resource "kubernetes_cluster_role_binding" "prometheus" {
  metadata {
    name = "prometheus"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "prometheus"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "default"
  }
}


resource "kubernetes_deployment" "prometheus" {
  metadata {
    name = local.prometheus-app-name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app" = local.prometheus-app-name
      }
    }
    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          app = local.prometheus-app-name
        }
      }
      spec {
        container {
          image = local.prometheus-image
          name  = "${local.prometheus-app-name}-image"
          env {
            name = "GRAFANA_API_KEY"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.grafana-api-key.metadata[0].name
                key  = "key"
              }
            }
          }
          env {
            name  = "GRPC_EXPORTER_TARGET"
            value = "${kubernetes_service.grpc-exporter.metadata[0].name}:9090"
          }
        }
      }
    }
  }
}

