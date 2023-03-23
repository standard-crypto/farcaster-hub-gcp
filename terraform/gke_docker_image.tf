locals {
  image_tag = "sha256:54249cc80f6e37e9120833a2a695c4b47c06e8ecde4a28ee9e2816083723f97a"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
