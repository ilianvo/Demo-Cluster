variable "region" {
  
}
variable "Demo-type" {
  type        = string
  
}

variable "environment" {
  type        = string
}

variable "cidr" {
}

variable "private_subnet_cidr" {
  type = list(string)
}

variable "public_subnet_cidr" {
  type = list(string)
}

locals {
  allowed_ports = [80, 443,8888,5000]
}

