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
module "TF_CreateVM" {
  source        = "./modules/TF_CreateVM"
  location      = var.location
  rgname        = azurerm_resource_group.rg.name
  NInterface_ID = [module.TF_CreateNI.NInterface_ID]
}

//data "azurerm_public_ip" "ip" {
//  name                = module.TF_CreateIP.public_IP_name
//  resource_group_name = azurerm_virtual_machine.vm.resource_group_name
//  depends_on          = ["azurerm_virtual_machine.vm"]
//}

output "os_sku" {
  value = lookup(var.sku, var.location)
}
