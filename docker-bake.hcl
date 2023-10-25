group "default" {
    targets = [
        "nginx"
    ]
}

target "nginx" {
    tags = ["us-west1-docker.pkg.dev/sc-farcaster/docker/nginx"]
    platforms = ["linux/amd64"]
    context = "./docker/nginx"
}