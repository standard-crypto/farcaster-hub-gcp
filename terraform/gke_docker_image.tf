locals {
  image_tag = "sha256:ade02555b6f0344372d35965fc8dbbc6f78a0f383f8ec46fb1101b2c71777094"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
