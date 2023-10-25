locals {
  prometheus-image_tag    = "sha256:bffd8d08241fea683d3f0270fd6d4c9dd3d822e5c0042c58e6a2936c2393d300"
  prometheus-image        = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/prometheus@${local.prometheus-image_tag}"
  grpc-exporter-image_tag = "sha256:5289fa51f3b324f23adfc1fb675d6da20bc330f3d793d4b5b70f3e7b18aff4ba"
  grpc-exporter-image     = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/grpc-exporter@${local.grpc-exporter-image_tag}"
  nginx-image_tag         = "sha256:527c3b1ff8f9fbc46a0f70c6d75f3cfdf210a123a7d46f0b76eeaf454b29b9c3"
  nginx-image             = "${var.region}-docker.pkg.dev/${var.project-id}/${google_artifact_registry_repository.artifact-registry.repository_id}/nginx@${local.nginx-image_tag}"
}
