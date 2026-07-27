resource "google_container_cluster" "primary" {
    name = "gitops-gke"
    location = "us-central1"
    enable_autopilot = true
    deletion_protection = false
    depends_on = [
        google_project_service.compute,
        google_project_service.container
    ]
}

resource "google_project_service" "compute" {
  project             = "gitops-gke-pipeline-503620"
  service             = "compute.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "container" {
  project             = "gitops-gke-pipeline-503620"
  service             = "container.googleapis.com"
  disable_on_destroy  = false
}
