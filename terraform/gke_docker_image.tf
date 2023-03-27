locals {
  image_tag = "sha256:0e569d3ace438d99450fc40ec6000c82b089f7da7d91c6a46e7cdaec220f86b1"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
