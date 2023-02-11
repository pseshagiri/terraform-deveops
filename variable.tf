variable "region" {
  type        = string
  description = "Available zone"
  default     = "ap-south-1"
}
variable "instanceType" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"
}
variable "ami" {
  type        = string
  description = "ami"
  default     = "ami-079b5e5b3971bd10d"
}
variable "vpc_name" {
  type        = string
  description = "vpc_name"
}

variable "cidr_block_value" {
  type        = string
  description = "cidr_block_value "
  default     = "10.0.0.0/16"
}

variable "var_route_table" {
  type        = string
  description = "route table "
  default     = "seshagiri_route_table"
}


locals {
  subnet_cidr_ip_addresses = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  subnet_Ip_Address = {
    "subnet1_public"  = { name = "subnet1_public", cidr = local.subnet_cidr_ip_addresses[0], public_subnet = true, az = "ap-south-1a" }
    "subnet2_public"  = { name = "subnet2_public", cidr = local.subnet_cidr_ip_addresses[1], public_subnet = true, az = "ap-south-1a" }
    "subnet3_private" = { name = "subnet3_private", cidr = local.subnet_cidr_ip_addresses[2], public_subnet = false, az = "ap-south-1b" }
    "subnet4_private" = { name = "subnet4_private", cidr = local.subnet_cidr_ip_addresses[3], public_subnet = false, az = "ap-south-1b" }
  }
}
