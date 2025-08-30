output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.subnet1.id
  
}

output "network_security_group_name" {
  description = "The name of the Network Security Group"
  value       = azurerm_network_security_group.nsg.name
}
