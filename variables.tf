variable "project_id" {
    description     = "GCP Project ID"
    type            = string
}

variable "service_account_json_key" {
    description     = "GCP service account JSON key"
    type            = string
    sensitive       = true
}

variable "services" {
    description     = "GCP APIs & services required by the project"
    type            = list(string)
    default         = [
        "cloudbuild.googleapis.com",
        "iam.googleapis.com",
        "cloudfunctions.googleapis.com",
        "cloudresourcemanager.googleapis.com",
        "secretmanager.googleapis.com"
    ]
}