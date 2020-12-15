variable "location" {}

variable "admin_username" {
  type        = string
  default = "testadm"
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  default = "?TM5q*Nz"
  description = "Password must meet Azure complexity requirements"

}

variable "NInterface_ID" {
    type = list
    description = "Subnet ID"
}

variable "rgname" {
    type = string
    description = "Name of resource group"
}


variable "prefix" {
  type    = string
  default = "my"
}

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
