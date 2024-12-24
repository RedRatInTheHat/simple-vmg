output "vm_ips" {
  value       = [
    for vm in yandex_compute_instance_group.vm-group.instances: { 
        "public_ip" : vm.network_interface.0.nat_ip_address, 
        "private_ip": vm.network_interface.0.ip_address
     }
  ]
  description = "Private and public ips of created machines"
}

output "target_group_id" {
  value = yandex_compute_instance_group.vm-group.application_load_balancer.0.target_group_id
  description = "The ID of created target group"
}