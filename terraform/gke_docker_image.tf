locals {
  image_tag            = "sha256:5ee551a1ea487ce96c5e5e4b0c42b2696e053e27100b042bbbf5b8429f31ee92"
  image                = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
  prometheus-image_tag = "sha256:99864de019d3cd63c01b4f0b1676e1d93dee5a0c0425298aeec59e9937014210"
  prometheus-image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/prometheus@${local.prometheus-image_tag}"
}
