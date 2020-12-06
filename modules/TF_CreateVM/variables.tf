variable "location" {}

variable "admin_username" {
  type        = string
  default = "rrybka"
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  default = "Sct6JH88"
  description = "Password must meet Azure complexity requirements"

}

variable "NInterface_ID" {
    type = string
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

