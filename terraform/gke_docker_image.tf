locals {
  nginx-image_tag         = "sha256:d7022428caf43abd552355468dccb98d934905df536a9278400e3df3ed93ea23"
  nginx-image             = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/nginx@${local.nginx-image_tag}"
}
