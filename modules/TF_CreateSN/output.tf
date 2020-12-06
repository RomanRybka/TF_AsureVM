output "SN_name" {
    description = "Name of VN created"
    value = azurerm_subnet.subnet.id
    sensitive   = true
}