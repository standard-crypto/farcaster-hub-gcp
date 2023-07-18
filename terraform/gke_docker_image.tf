locals {
  image_tag            = "sha256:dc763b68cf852b113790bf3dd51fd8e739c1f94da48175865a9493d242ac1ef6"
  image                = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
  prometheus-image_tag = "sha256:99864de019d3cd63c01b4f0b1676e1d93dee5a0c0425298aeec59e9937014210"
  prometheus-image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/prometheus@${local.prometheus-image_tag}"
}
