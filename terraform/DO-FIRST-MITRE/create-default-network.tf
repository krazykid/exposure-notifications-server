provider "google" {
  project = local.project_id
  region  = local.region
}

# For beta-only resources like secrets-manager
provider "google-beta" {
  project = local.project_id
  region  = local.region
}

resource "google_compute_network" "default-vpc" {
  project                 = local.project_id
  name                    = "default"
  description             = "Default VPC network created for ENS"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default-us-east4" {
  project       = local.project_id
  name          = "us-east4"
  ip_cidr_range = "10.8.56.0/24"
  region        = "us-east4"
  network       = google_compute_network.default-vpc.id

  log_config {
    aggregation_interval = "INTERVAL_30_SEC"
    metadata             = "INCLUDE_ALL_METADATA"
  }
}