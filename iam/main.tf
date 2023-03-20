# region - cloud-functions-deployer 
resource "google_service_account" "gcf_deployer" {
    account_id      = "cloud-functions-deployer"
}

resource "google_project_iam_member" "gcf_deployer_roles" {
    for_each        = toset([
        "roles/source.reader",
        "roles/cloudfunctions.developer",
        "roles/iam.serviceAccountUser",
        "roles/logging.logWriter",
        "roles/secretmanager.secretAccessor"
    ])
    project         = var.project_id
    role            = each.key
    member          = "serviceAccount:${google_service_account.gcf_deployer.email}"
}
# endregion

# region - gcs-upload-proxy
resource "google_service_account" "gcs_upload_proxy" {
    account_id      = "gcs-upload-proxy"
}

resource "google_project_iam_member" "gcs_upload_proxy_roles" {
    for_each        = toset([
        "roles/iam.serviceAccountTokenCreator",
        "roles/storage.objectAdmin"
    ])
    project         = var.project_id
    role            = each.key
    member          = "serviceAccount:${google_service_account.gcs_upload_proxy.email}"
}
# endregion
