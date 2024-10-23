resource "google_compute_instance" "vm_instance" {
  name         = var.vm_instance_config.name
  machine_type = var.vm_instance_config.machine_type
  zone         = var.vm_instance_config.zone
  tags         = var.vm_instance_config.tags

  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.vm_instance_config.boot_disk.image
      type  = var.vm_instance_config.boot_disk.type
      size  = var.vm_instance_config.boot_disk.size
    }
  }

  network_interface {
    subnetwork = var.vm_instance_config.network_interface.subnetwork
  }

  metadata = {
    startup-script = var.vm_instance_config.metadata.startup-script
    enable-oslogin = var.vm_instance_config.metadata.enable-oslogin
  }
}

resource "google_compute_firewall" "firewall" {
  name    = var.firewall_config.name
  network = var.firewall_config.network

  allow {
    protocol = "tcp"
    ports    = var.vm_instance_config.ports
  }

  source_ranges = var.vm_instance_config.source_ranges
  target_tags   = var.vm_instance_config.tags
}
