variable "location" {}

variable "admin_username" {
  type        = string
//  default = "testadm"
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
//  default = "?TM5q*Nz"
  description = "Password must meet Azure complexity requirements"
}


variable "addr_prefix" {
  type    = string
  default = "192.168.123.0/24"
}

variable "prefix" {
  type    = string
  default = "my"
  description = "Resource name prefix"
}

//variable "az_subnet" {
//  type    = string
// description = "Name of Subnetwork"
//}

variable "tags" {
  type = map

  default = {
    Environment = "Terraform GS"
    Dept        = "Engineering"
  }
}

variable "sku" {
  default = {
    westus2 = "16.04-LTS"
    eastus  = "18.04-LTS"
  }
}
