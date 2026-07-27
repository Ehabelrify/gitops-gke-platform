terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = ">= 5.0"
        }
    }
}

provider "google" {
    project = "gitops-gke-pipeline-503620"
    region = "us-central1"
}

