output "public_IP" {
    description = "Public IP address"
    value = azurerm_public_ip.publicip.id
    sensitive   = true
}

output "public_IP_name" {
    description = "Public IP name"
    value = azurerm_public_ip.publicip.name
    sensitive   = true
}