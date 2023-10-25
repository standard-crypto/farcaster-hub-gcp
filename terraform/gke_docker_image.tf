locals {
  nginx-image_tag         = "sha256:527c3b1ff8f9fbc46a0f70c6d75f3cfdf210a123a7d46f0b76eeaf454b29b9c3"
  nginx-image             = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/nginx@${local.nginx-image_tag}"
}
