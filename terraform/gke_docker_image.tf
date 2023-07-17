locals {
  image_tag            = "sha256:dc763b68cf852b113790bf3dd51fd8e739c1f94da48175865a9493d242ac1ef6"
  image                = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
  prometheus-image_tag = "sha256:e9fb9c766dc649ca8db992f95fd1dd97d5cf7c5bc2fc2dfc67288e63e85d9958"
  prometheus-image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/prometheus@${local.prometheus-image_tag}"
}
