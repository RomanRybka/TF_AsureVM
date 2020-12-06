# Configure the Microsoft Azure Provider.
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}TFRG"
  location = var.location
  tags     = var.tags
}

# Create virtual network
module "TF_CreateVN" {
  source    = "./modules/TF_CreateVN"

  rgname    = azurerm_resource_group.rg.name
  location  = var.location


}
# Create subnet
module "TF_CreateSN" {
  source    = "./modules/TF_CreateSN"

  rgname    = azurerm_resource_group.rg.name
  location  = var.location
  VN_name   = module.TF_CreateVN.VN_name
}

# Create public IP
module "TF_CreateIP" {
  source    = "./modules/TF_CreateIP"
  location            = var.location
  rgname              = azurerm_resource_group.rg.name

}

# Create Network Security Group and rule
module "TF_CreateNSG" {
  source    = "./modules/TF_CreateNSG"
  location            = var.location
  rgname              = azurerm_resource_group.rg.name
}

# Create network interface
module "TF_CreateNI" {
  source    = "./modules/TF_CreateNI"
  location            = var.location
  rgname              = azurerm_resource_group.rg.name
  subnetid            = module.TF_CreateSN.SN_name
  pubipaddrid         = module.TF_CreateIP.public_IP
}

# Create a Linux virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.prefix}TFVM"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [module.TF_CreateNI.NInterface_ID]
  vm_size               = "Standard_DS1_v2"
  tags                  = var.tags

  storage_os_disk {
    name              = "${var.prefix}OsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = lookup(var.sku, var.location)
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.prefix}TFVM"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

}

//data "azurerm_public_ip" "ip" {
//  name                = module.TF_CreateIP.public_IP_name
//  resource_group_name = azurerm_virtual_machine.vm.resource_group_name
//  depends_on          = ["azurerm_virtual_machine.vm"]
//}

output "os_sku" {
  value = lookup(var.sku, var.location)
}
