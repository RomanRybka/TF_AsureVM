output "NInterface_ID" {
    description = "Network Interface ID"
    value = azurerm_network_interface.nic.id
    sensitive   = true
}
