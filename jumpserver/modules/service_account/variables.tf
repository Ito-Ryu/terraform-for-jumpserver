variable "service_account_config" {
  description = "config for service account"
  type = object({
    service_account_id = string
    display_name = string
    description = string
  })
}
