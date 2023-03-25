terraform {
    required_providers {
        github = {
            source                      = "integrations/github"
            version                     = "~> 5.0"
        }
    }
}

provider "github" {
    token                               = var.github_token
}

provider "google" {
    project                             = var.project_id
    credentials                         = var.service_account_json_key
}

resource "google_project_service" "default" {
    project                             = var.project_id
    for_each                            = toset(var.services)
    service                             = each.key
    disable_dependent_services          = true
}

module "iam" {
    source                              = "./iam"
    project_id                          = var.project_id
}

module "repos" {
    source                              = "./repos"
}

module "cloud_build" {
    source                              = "./cloud_build"
    project_id                          = var.project_id

    github_repo_owner                   = var.github_repo_owner
    gcs_upload_proxy_github_repo_name   = module.repos.gcs_upload_proxy_github_repo_name
    cloud_build_sa_email                = module.iam.gcf_deployer_sa_email
}
