locals {
  image_tag = "sha256:3a5d2df7aa159ec6e957c92cefaad3caa16f74106c6739df0afe3567342a4b7e"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
