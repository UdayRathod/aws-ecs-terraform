resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    name = "ecs-vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 1) ## takes 10.0.0.0/16 --> 10.0.1.0/24
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[0]
}

resource "aws_subnet" "subnet-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 2) ## takes 10.0.0.0/16 --> 10.0.1.0/24
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[1]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "subnet_route-1" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "subnet_route-2" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.rt.id
}