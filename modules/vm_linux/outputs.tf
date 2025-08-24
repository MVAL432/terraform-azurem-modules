output "id"         { value = azurerm_linux_virtual_machine.this.id }
output "private_ip" { value = try(azurerm_linux_virtual_machine.this.private_ip_address, null) }
