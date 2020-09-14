variable "env_project_id_map" {
  type = map(string)
  default = {
    "developer-jmazella" = "mitre-pact-jmazella"
    "testing-qwerty" = "mitre-pact-testing-qwerty"
  }
}

variable "env_subnet_us_east4_cidr_map" {
  type = "map"
  default = {
    "developer-jmazella" = "10.8.56.0/24"
  }
}

locals {
  project_id = lookup(var.env_project_id_map, terraform.workspace)
  subnet_us_east4_cidr = lookup(var.env_subnet_us_east4_cidr_map, terraform.workspace, "10.8.56.0/24")
  region = "us-east4"

  c19_dev_roles = [
    "roles/browser",
    "roles/cloudbuild.builds.editor",
    "roles/cloudkms.publicKeyViewer",
    "roles/cloudscheduler.admin",
    "roles/cloudsql.admin",
    "roles/cloudsql.client",
    "roles/editor",
    "roles/iam.serviceAccountUser",
    "roles/run.admin",
    "roles/secretmanager.admin",
    "roles/secretmanager.secretAccessor",
    "roles/storage.admin",
    "roles/viewer",
  ]
}