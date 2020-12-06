variable "location" {}

variable "subnetid" {
    type = string
    description = "Subnet ID"
}

variable "pubipaddrid" {
    type = string
    description = "Public IP adress ID"
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

