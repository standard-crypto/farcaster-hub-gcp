locals {
  image_tag = "sha256:48be1871d78c584e5d7563925d1c4d9a5b07af4f9df6a438d994c19d0c3736ac"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
