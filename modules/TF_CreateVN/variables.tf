variable "location" {}

variable "addr_space" {
    type = string
    description = "VN address space definition"
    default = "192.168.0.0/16"
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

