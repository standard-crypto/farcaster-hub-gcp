locals {
  image_tag = "sha256:d7d66fb5797f20460978e2357e1c3766883b1388e2c0fb52efd5d3d13bf726f5"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
