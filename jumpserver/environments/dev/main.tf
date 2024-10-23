module "service_account" {
  source = "../../modules/service_account"

  service_account_config = {
    service_account_id = "jumpserver-service-account"
    display_name       = "JumpServer Service Account"
    description        = "JumpServer用のサービスアカウント"
  }
}

module "jumpserver" {
  source = "../../modules/vm_instance"

  vm_instance_config = {
    name          = "jumpserver"
    zone          = "asia-northeast1-a"
    machine_type  = "e2-micro"
    source_ranges = ["35.235.240.0/20"]
    tags          = ["jumpserver"]
    ports         = [22]

    boot_disk = {
      image = "ubuntu-2004-lts"
      type  = "pd-ssd"
      size  = 20
    }

    network_interface = {
      subnetwork = "default"
    }

    metadata = {
      startup-script = "echo Hello, Jumpserver!"
      enable-oslogin = "TRUE"
    }
  }

  firewall_config = {
    name    = "jumpserver"
    network = "default"
  }

  depends_on = [
    module.service_account
  ]
}
