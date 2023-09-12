output "statsd_host" {
  value = "${kubernetes_service.graphite.metadata[0].name}:${local.statsd_port}"
}

output "graphite_web_url" {
  value = "http://${trimsuffix(google_dns_record_set.graphite_dns_recordset.name, ".")}"
}
