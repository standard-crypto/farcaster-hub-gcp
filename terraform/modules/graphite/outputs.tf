output "statsd_host" {
  value = "${kubernetes_service.graphite.metadata[0].name}:${local.statsd_port}"
}
