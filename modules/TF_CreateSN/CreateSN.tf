# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}TFSubnet"
  resource_group_name  = var.rgname
  virtual_network_name = var.VN_name
  address_prefixes       = ["${var.addr_prefix}"]
}