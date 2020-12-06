variable "location" {}

variable "addr_prefix" {
  type    = string
  default = "192.168.1.0/24"
}

variable "VN_name" {
    type = string
    description = "Name of Virtual Network"
}

variable "rgname" {
    type = string
    description = "Name of resource group"
}

variable "prefix" {
  type    = string
  default = "my"
}



