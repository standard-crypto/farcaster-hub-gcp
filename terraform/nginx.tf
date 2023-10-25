locals {
  nginx-app-name   = "nginx"
  common-domain    = "farcaster.standardcrypto.vc"
  alternate-domain = "farcaster.standardcryptovc.com"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = "it@standardcryptovc.com"
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = local.common-domain
  subject_alternative_names = ["*.${local.common-domain}", "*.${local.alternate-domain}"]

  dns_challenge {
    provider = "gcloud"
    config = {
      "GCE_PROJECT"         = var.project-id
      "GCE_SERVICE_ACCOUNT" = var.GOOGLE_CREDENTIALS
    }
  }
}

resource "kubernetes_secret" "tls-secret" {
  metadata {
    name = "tls-secret"
  }

  data = {
    "tls.crt" = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"
    "tls.key" = acme_certificate.certificate.private_key_pem
  }

  type = "kubernetes.io/tls"
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app" = local.nginx-app-name
      }
    }
    strategy {
      type = "Recreate"
    }
    template {
      metadata {
        labels = {
          app = local.nginx-app-name
        }
      }
      spec {
        container {
          image = local.nginx-image
          name  = "${local.nginx-app-name}-image"
          volume_mount {
            name       = "tls-key"
            mount_path = "/etc/certs"
            read_only  = "true"
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
            name  = "NGINX_SERVICE_NAME"
            value = kubernetes_service.farcaster.metadata[0].name
          }
          env {
            name  = "NGINX_SERVER_NAME"
            value = "hub.${local.common-domain}"
          }
        }
        volume {
          name = "tls-key"
          secret {
            secret_name = kubernetes_secret.tls-secret.metadata[0].name
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = local.nginx-app-name
    annotations = {
      "cloud.google.com/network-tier" = "Standard"
    }
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = local.nginx-app-name
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
    load_balancer_ip = google_compute_address.farcaster-hub-ip.address
  }
}
