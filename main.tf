// Creating an VPC 
resource "aws_vpc" "seshagiri-app-vpc" {
  Name                 = var.vpc_name
  instance_tenancy     = "default"
  cidr_block           = var.cidr_block_value
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "name" = var.vpc_name
  }
}

resource "aws_subnet" "seshagiri_app_subnet" {

  vpc_id   = aws_vpc.seshagiri-app-vpc.id
  for_each = local.subnet_Ip_Address
  //name                    = local.subnet_Ip_Address[each.key].name
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = each.value.public_subnet
  availability_zone       = each.value.az

  tags = {
    "name" = each.value.name
  }

}

resource "aws_route_table" "seshagiri_app_rt" {
  vpc_id = aws_vpc.seshagiri-app-vpc.id
  //name   = var.var_route_table
  tags = {
    "name"        = var.var_route_table
    "description" = "route table mapped to vpc"
  }

}

resource "aws_route_table_association" "seshagiri_app_rt_assoc" {
  route_table_id = aws_route_table.seshagiri_app_rt.id
  for_each       = local.subnet_Ip_Address
  subnet_id      = aws_subnet.seshagiri_app_subnet[each.key].id


}
