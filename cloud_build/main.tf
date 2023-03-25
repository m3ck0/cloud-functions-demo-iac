
resource "google_cloudbuild_trigger" "deploy_gcs_upload_proxy" {
    name                                = "deploy-gcs-upload-proxy-gcf"
    # location                            = "global"  # NOTE: by default

    github {
        owner                           = var.github_repo_owner
        name                            = var.gcs_upload_proxy_github_repo_name
        push {
            branch                      = var.trigger_branch
        }
    }

    filename                            = "cloudbuild.yaml"
    service_account                     = var.cloud_build_sa_email
}
