output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.subnet.id
  
}

output "network_security_group_id" {
  description = "The ID of the Network Security Group associated with the Subnet"
  value       = azurerm_subnet_network_security_group_association.nsg_assosiation.network_security_group_id
  
}