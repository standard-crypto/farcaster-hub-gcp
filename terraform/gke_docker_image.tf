locals {
  image_tag = "sha256:893c8d4553350d5482a126e012a05f12ad9fa7f4be364fe8f64679ba0acabd19"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
