locals {
  image_tag            = "sha256:5b78e627fd71b349c9e607dc4ca80005dcbe7fb6e4be4eb4ef85a2e01f826bb8"
  image                = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
  prometheus-image_tag = "sha256:e9fb9c766dc649ca8db992f95fd1dd97d5cf7c5bc2fc2dfc67288e63e85d9958"
  prometheus-image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/prometheus@${local.prometheus-image_tag}"
}
