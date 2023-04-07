locals {
  image_tag = "sha256:b27082366fc2fcb1a9c928213ec9ccb51a3aef579dcff6e41d1b4b451c43b73e"
  image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
}
