resource "google_service_account" "service_account" {
  account_id   = var.service_account_config.service_account_id
  display_name = var.service_account_config.display_name
  description  = var.service_account_config.description
}
