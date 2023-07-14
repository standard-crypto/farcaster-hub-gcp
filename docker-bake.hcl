group "default" {
    targets = [
        "hubble",
    ]
}

target "hubble" {
    tags = ["us-west1-docker.pkg.dev/sc-farcaster/docker/farcaster-hubble", "us-west1-docker.pkg.dev/sc-farcaster/docker/farcaster-hubble:latest"]
    platforms = ["linux/amd64"]
    context = "./docker/farcaster-hubble"
}

target "prometheus" {
    tags = ["us-west1-docker.pkg.dev/sc-farcaster/docker/prometheus"]
    platforms = ["linux/amd64"]
    context = "./docker/prometheus"
}