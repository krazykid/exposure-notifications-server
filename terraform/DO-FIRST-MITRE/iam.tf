data "google_project" "project" {
  project_id = local.project_id
}

resource "google_project_service" "pact_config_gcp_services" {
  project    = data.google_project.project.project_id
  depends_on = [data.google_project.project]

  for_each                   = toset(local.gcp_services)
  service                    = each.value
  disable_dependent_services = true
}

resource "google_project_iam_member" "assign_c19_pact_roles" {
  project = data.google_project.project.project_id

  for_each = toset(local.c19_dev_roles)
  role     = each.value
  member   = "group:c19-pact@mitre.org"

  depends_on = [
    data.google_project.project,
  ]
}

# c19-pact@mitre.org