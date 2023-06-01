locals {
  image_tag = "sha256:04064d3cfb88f6edb0bde5b76dd447393a40e30941d2c7be3fc0956e80df28d5"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
