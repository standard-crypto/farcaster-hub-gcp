locals {
  image_tag            = "sha256:449368163b6fc653d3a45447d55318e694e7ba74cb86d989d154d7ee0022fd63"
  image                = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
  prometheus-image_tag = "sha256:99864de019d3cd63c01b4f0b1676e1d93dee5a0c0425298aeec59e9937014210"
  prometheus-image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/prometheus@${local.prometheus-image_tag}"
}
