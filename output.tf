output "vpc_name" {
  description = "OutPut VPC name"
  value       = aws_vpc.seshagiri-app-vpc.id
}

output "cidr_block" {
  description = "OutPut VPC name"
  value       = aws_vpc.seshagiri-app-vpc.cidr_block
}