provider "google" {
  project           = var.project_id
  credentials       = var.service_account_json_key
}

resource "google_project_service" "default" {
  project                     = var.project_id
  for_each                    = toset(var.services)
  service                     = each.key
  disable_dependent_services  = true
}

module "iam" {
  source                      = "./iam"

  project_id                  = var.project_id
}
