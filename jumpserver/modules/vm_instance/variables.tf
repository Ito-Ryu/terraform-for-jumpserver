variable "vm_instance_config" {
  description = "config for vm instance"
  type = object({
    name          = string
    machine_type  = string
    zone          = string
    source_ranges = list(string)
    tags          = list(string)
    ports         = list(number)

    boot_disk = object({
      size  = number
      image = string
      type  = string
    })

    network_interface = object({
      subnetwork = string
    })

    metadata = object({
      startup-script = string
      enable-oslogin = string
    }),
  })
}

variable "firewall_config" {
  description = "config for firewall"
  type = object({
    name    = string
    network = string
  })
}
