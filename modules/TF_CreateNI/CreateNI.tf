# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}NIC"
  location            = var.location
  resource_group_name = var.rgname
  tags                = var.tags

  ip_configuration {
    name                          = "${var.prefix}NICConfg"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = var.pubipaddrid
  }
}