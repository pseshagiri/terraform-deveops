resource "aws_internet_gateway" "product_igw" {
   vpc_id = aws_vpc.seshagiri-app-vpc.id
   name = "product_igw"
}