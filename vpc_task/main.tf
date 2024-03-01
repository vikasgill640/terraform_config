resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  tags = merge(var.tags, {
    Name : var.vpc_name
  })
}

resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
 
 tags = merge(var.tags, {
    Name : "${var.vpc_name}-public_subnet"
  })
}
resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 cidr_block = element(var.private_subnet_cidrs, count.index)
 
 tags = merge(var.tags, {
    Name : "${var.vpc_name}-private_subnet"
  })
}


resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 tags = merge(var.tags, {
    Name : "${var.vpc_name}-ig"
  })
}

resource "aws_route_table" "public_rt" {
 vpc_id = aws_vpc.main.id
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gw.id
 }
tags = merge(var.tags, {
    Name : "${var.vpc_name}-public_rt"
  })
}

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(aws_subnet.public_subnets[*].id)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.public_rt.id
}
