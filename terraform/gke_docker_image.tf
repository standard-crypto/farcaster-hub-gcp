locals {
  image_tag = "sha256:38d9fd9d0c716504b5ad2a8fcf14e0f22adc74eb2cb70b19299acdab91fcab0a"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
