# Create public IP
resource "azurerm_public_ip" "publicip" {
  name                = "${var.prefix}TFPublicIP"
  location            = var.location
  resource_group_name = var.rgname
  allocation_method   = "Dynamic"
  tags                = var.tags
}