terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = ">= 5.0"
        }
        helm = {
            source = "hashicorp/helm"
            version = ">= 2.0"
        }
    }
}

provider "google" {
    project = "gitops-gke-pipeline-503620"
    region = "us-central1"
}

data "google_client_config" "default" {}

provider "helm" {
  kubernetes = {
    host                   = "https://${google_container_cluster.primary.endpoint}"
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
  }
}
