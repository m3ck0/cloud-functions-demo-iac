terraform {
    required_providers {
        github = {
            source                      = "integrations/github"
            version                     = "~> 5.0"
        }
    }
}

resource "github_repository" "gcs_upload_proxy_github_repo" {
    name                                = "cloud-functions-demo-gcs-upload-proxy"
    visibility                          = "private"
}
