# Output the Public IP of the Web VM
output "web_vm_public_ip" {
  value = azurerm_linux_virtual_machine.web_vm.public_ip_address
}

#Output the Public IP of the three tier app via module
output "module_web_vm_public_ip" {
  value = module.three_tier_app.module_web_vm_public_ip
}

output "module_web_vm_public_ip_count" {
  value = [for i in range(var.instance_count) : module.three_tier_app_count[i].module_web_vm_public_ip_count]
}
