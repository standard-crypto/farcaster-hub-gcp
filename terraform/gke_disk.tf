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

resource "google_compute_disk" "farcaster" {
  name = "pvc-964b6cad-6a12-49f6-a865-96f46c343a67"
  description = jsonencode(
    {
      "kubernetes.io/created-for/pv/name"       = "pvc-964b6cad-6a12-49f6-a865-96f46c343a67"
      "kubernetes.io/created-for/pvc/name"      = "farcaster-hub"
      "kubernetes.io/created-for/pvc/namespace" = "default"
      "storage.gke.io/created-by"               = "pd.csi.storage.gke.io"
    }
  )
  labels = {
    "goog-gke-volume"           = ""
    "goog-k8s-cluster-location" = "us-west1"
    "goog-k8s-cluster-name"     = "farcaster-hub-cluster"
    "goog-k8s-node-pool-name"   = "farcaster-hub-node-pool"
  }
}

resource "google_compute_resource_policy" "farcaster-snapshot-policy" {
  name   = "farcaster-snapshot-policy"
  region = "us-west1"
  snapshot_schedule_policy {
    schedule {
      weekly_schedule {
        day_of_weeks {
          day        = "SUNDAY"
          start_time = "04:00"
        }
      }
    }
    retention_policy {
      max_retention_days    = 60
      on_source_disk_delete = "APPLY_RETENTION_POLICY"
    }
  }
}

resource "google_compute_disk_resource_policy_attachment" "farcaster-snapshot-policy-attachment" {
  name = google_compute_resource_policy.farcaster-snapshot-policy.name
  disk = google_compute_disk.farcaster.name
  zone = google_compute_disk.farcaster.zone
}