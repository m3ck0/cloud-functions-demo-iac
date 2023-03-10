resource "google_service_account" "cloud_functions_deployer" {
    account_id      = "cloud-functions-deployer"
}

resource "google_service_account" "gcs_upload_proxy" {
    account_id      = "gcs-upload-proxy"
}

resource "google_service_account" "file_processor" {
    account_id      = "file-processor"
}

resource "google_service_account" "scraper" {
    account_id      = "scraper"
}

resource "google_service_account" "" {
    account_id      = ""
}

resource "google_service_account" "" {
    account_id      = ""
}

