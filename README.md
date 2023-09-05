# Farcaster Hub

IAC used for managing the deployment of a Farcaster hub within a fresh GCP project

## Architecture Overview

- All GCP and Kubernetes resources defined and managed by Terraform
- Persistent disk mounted to the local rocksdb directory
- Static IP and corresponding DNS record provisioned
- Small, dedicated GKE cluster is provisioned within its own dedicated VPC
- Kubernetes LoadBalancer service is provisioned along with corresponding firewall rules for inbound RPC and libp2p traffic
- A GCP Artifact Registry instance (optional, and private to the GCP project) is used for the custom prometheus infrastructure
- Kubernetes Secrets are deployed to manage the Alchemy/Infura/etc node RPC URL and the libp2p peer identity used by the hub
- Custom prometheus metrics for monitoring a hub's sync status
  - Note: Integration with the prometheus and grafana stack provided by the Farcaster team is in progress

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
- Set the values for the kubernetes secrets at [gke_secrets.tf](terraform/gke_secrets.tf)
- Update the docker repository in [docker-bake.hcl](docker-bake.hcl) used in pushing new build images

## Update Instructions

Simple changes to the config of the hub can be propagated as follows:

1. Fetch the tag of the new hub docker image from https://github.com/farcasterxyz/hub-monorepo/releases
2. Write the image tag to [kubernetes](terraform/gke_deployment.tf) -> `image = "farcasterxyz/hubble:[TAG]"`
3. If using terraform cloud, commit and push to the git remote to trigger a deployment at https://app.terraform.io/
