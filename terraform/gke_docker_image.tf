locals {
  image_tag = "sha256:7c037ec53b5e32cc33154575a73139f7c679faa13b12eb4785768a3d8cdc80e0"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
