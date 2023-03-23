# Farcaster Hub

IAC used for managing the deployment of a Farcaster hub within a fresh GCP project

## Copying This Deployment

This configuration is written for a clean GCP project. 

Most things should work as-is for running in any GCP project.

You may want to at least:

- Change the DNS records created [by terraform](terraform/dns.tf)
- Edit the [backend](terraform/backend.tf) where terraform plans and runs (currently using hosted terraform.io)
- Ensure terraform is configured with credentials to a GCP service account with appropriate scopes to create GCP resources (including new IAM roles)
- Edit the per-GCP-project values in [vars.tf](terraform/vars.tf)
- Remove configuration to create the [GCP docker repository](terraform/artifact_repository.tf) if it has already been created for the GCP project
- Set the value for the hub libp2p peer ID kubernetes secret
  - Run the docker image locally and generate a new libp2p identity (`yarn identity create && base64 -w0 .hub/default_id.protobuf`)
  - Upload the base64 value as a new secret value revision
- Set the value for the ethRpcUrl kubernetes secret

## Update Instructions

Simple changes to the config of the hub can be propagated as follows:

1. Make any changes to the farcaster hub container in [docker](./docker/)
1. Run `docker buildx bake --push` from the repository root
1. Fetch the sha256 of the new image (from logs or from [GCP](https://console.cloud.google.com/artifacts/docker/sc-farcaster/us-west1/docker/farcaster-hubble?project=sc-farcaster))
1. Write the new image sha256 value to [kubernetes.tf](./terraform/gke_docker_image.tf) -> `image_tag`
1. Commit and push to the git remote, which will automatically trigger a terraform deployment at https://app.terraform.io/
