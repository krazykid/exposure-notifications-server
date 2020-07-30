variable "env_project_id_map" {
  type = "map"
  default = {
    "developer-jmazella" = "mitre-pact-jmazella"
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

}