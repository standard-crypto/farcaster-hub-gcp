locals {
  app_name          = "graphite"
  statsd_port       = 8125
  graphite_web_port = 80
}

resource "kubernetes_deployment" "graphite" {
  metadata {
    name = local.app_name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app" = local.app_name
      }
    }
    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          app = local.app_name
        }
      }
      spec {
        container {
          image = "graphiteapp/graphite-statsd:1.1.10-5"
          name  = "${local.app_name}-image"
          port {
            name           = "statsd"
            protocol       = "UDP"
            container_port = local.statsd_port
          }
          port {
            name           = "graphite-web"
            protocol       = "TCP"
            container_port = local.graphite_web_port
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

resource "kubernetes_service" "graphite" {
  metadata {
    name = local.app_name
    annotations = {
      "cloud.google.com/network-tier" = "Standard"
    }
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = local.app_name
    }
    port {
      name        = "graphite-web"
      protocol    = "TCP"
      port        = local.graphite_web_port
      target_port = local.graphite_web_port
    }
    port {
      name        = "statsd"
      protocol    = "UDP"
      port        = local.statsd_port
      target_port = local.statsd_port
    }
    load_balancer_ip = google_compute_address.graphite_ip.address
  }
}
