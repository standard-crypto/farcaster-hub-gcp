group "default" {
    targets = [
        "prometheus",
        "grpc-exporter"
    ]
}

target "prometheus" {
    tags = ["us-west1-docker.pkg.dev/sc-farcaster/docker/prometheus"]
    platforms = ["linux/amd64"]
    context = "./docker/prometheus"
}

target "grpc-exporter" {
    tags = ["us-west1-docker.pkg.dev/sc-farcaster/docker/grpc-exporter"]
    platforms = ["linux/amd64"]
    context = "./docker/grpc-exporter"
}

target "nginx" {
    tags = ["us-west1-docker.pkg.dev/sc-farcaster/docker/nginx"]
    platforms = ["linux/amd64"]
    context = "./docker/nginx"
}