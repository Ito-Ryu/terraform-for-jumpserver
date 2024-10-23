terraform {
  backend "gcs" {
    bucket  = "jumpserver"
    prefix  = "terraform/state"
  }
}
