locals {
  image_tag            = "sha256:449368163b6fc653d3a45447d55318e694e7ba74cb86d989d154d7ee0022fd63"
  image                = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/farcaster-hubble@${local.image_tag}"
  prometheus-image_tag = "sha256:bffd8d08241fea683d3f0270fd6d4c9dd3d822e5c0042c58e6a2936c2393d300"
  prometheus-image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/prometheus@${local.prometheus-image_tag}"
  grpc-exporter-image_tag = "sha256:d72f1edf53c4d0d59b4d5bb22513f2b6e395053ddeae5081a74b53fc6c6ff407"
  grpc-exporter-image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/grpc-exporter@${local.grpc-exporter-image_tag}"
}
