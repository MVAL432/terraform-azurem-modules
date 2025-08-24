output "public_ip_id" { value = try(azurerm_public_ip.this[0].id, null) }
output "public_ip"    { value = try(azurerm_public_ip.this[0].ip_address, null) }
