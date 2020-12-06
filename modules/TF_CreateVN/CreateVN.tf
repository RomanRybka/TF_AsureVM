# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}TFVnet"
  address_space       = ["${var.addr_space}"]
  resource_group_name = var.rgname
  location            = var.location
  tags                = var.tags
}
