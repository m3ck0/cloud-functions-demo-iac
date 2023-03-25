variable "project_id" {
    description     = "GCP Project ID"
    type            = string
}

variable "github_repo_owner" {
    description     = "GitHub repository owner name"
    type            = string
    sensitive       = true
}

variable "gcs_upload_proxy_github_repo_name" {
    description     = "GitHub repository name"
    type            = string
    sensitive       = true
}

variable "trigger_branch" {
    description     = "Cloud Build trigger repository branch"
    type            = string
    default         = "main"
}

variable "cloud_build_sa_email" {
    description     = "Owner of the GitHub repository"
    type            = string
    sensitive       = true
}
