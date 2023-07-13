locals {
  image_tag = "sha256:7fc0f4cb302d6803b67c218e6c5966606d6e6b4f4887a51b37b309f09411f86d"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
