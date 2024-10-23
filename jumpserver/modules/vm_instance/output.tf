output "instance_name" {
  description = "The name of the VM instance"
  value       = google_compute_instance.vm_instance.name
}

output "firewall_rule_name" {
  description = "The name of the firewall rule"
  value       = google_compute_firewall.firewall.name
}
