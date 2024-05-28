# Output the Public IP of the Web VM
output "web_vm_public_ip" {
  value = azurerm_linux_virtual_machine.web_vm.public_ip_address
}

#Output three tier module Web VM
output "module_web_vm_public_ip" {
  value = module.three_tier_app.module_web_vm_public_ip
}
