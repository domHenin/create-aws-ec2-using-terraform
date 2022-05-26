#AWS VPC 
resource "aws_vpc" "vpc" {
  provider = aws.development
  cidr_block = "10.20.20.0/25"

  tags = {
    "Name" = "vpc"
  }
}

#AWS Subnet - Private 
resource "aws_subnet" "subnet_private" {
  provider = aws.development
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.20.20.0/26"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "private_subnet"
  }
}

#AWS Subnet - Public
resource "aws_subnet" "subnet_public" {
  provider = aws.development
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.20.20.64/26"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "public_subnet"
  }
}

#AWS Route Table
resource "aws_route_table" "route_table" {
  provider = aws.development
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "route_table"
  }
  
}