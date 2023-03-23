resource "kubernetes_storage_class" "farcaster" {
  metadata {
    name = var.name
  }
  storage_provisioner    = "kubernetes.io/gce-pd"
  volume_binding_mode    = "Immediate"
  allow_volume_expansion = true
  reclaim_policy         = "Retain"
  parameters = {
    "type"             = "pd-standard"
    "fstype"           = "ext4"
    "replication-type" = "none"
  }
}

resource "kubernetes_persistent_volume_claim" "farcaster" {
  metadata {
    name = var.name
  }
  spec {
    storage_class_name = kubernetes_storage_class.farcaster.metadata[0].name
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage : "50Gi"
      }
    }
  }
}
