locals {
  image_tag = "sha256:0cf917d9980afb899e84c843551ba0cef700757cdf273c193db4302347121cd3"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
