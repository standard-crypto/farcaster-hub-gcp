locals {
  image_tag = "sha256:450fea246318594f1870b0a7f546b57e68c2f6b414494780e943c60927394af9"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
