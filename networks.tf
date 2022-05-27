#AWS VPC 
resource "aws_vpc" "vpc" {
  provider   = aws.development
  cidr_block = "10.20.20.0/25"

  tags = {
    "Name" = "vpc"
  }
}

#AWS Subnet - Private 
resource "aws_subnet" "subnet_private" {
  provider          = aws.development
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.20.20.0/26"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "private_subnet"
  }
}

#AWS Subnet - Public
resource "aws_subnet" "subnet_public" {
  provider          = aws.development
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.20.20.64/26"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "public_subnet"
  }
}

#AWS Route Table
resource "aws_route_table" "route_table" {
  provider = aws.development
  vpc_id   = aws_vpc.vpc.id

  tags = {
    "Name" = "route_table"
  }
}

#AWS Route Table Association - Public
resource "aws_route_table_association" "rt_ass_public" {
  provider       = aws.development
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.route_table.id
}

#AWS Route Table Association - Private
resource "aws_route_table_association" "rt_ass_private" {
  provider       = aws.development
  subnet_id      = aws_subnet.subnet_private
  route_table_id = aws_route_table.route_table.id
}

#AWS Internet Gateway
resource "aws_internet_gateway" "igw" {
  provider = aws.development
  vpc_id   = aws_vpc.vpc.id

  tags = {
    "Name" = "internet_gateway"
  }
}

#AWS Route
resource "aws_route" "internet_route" {
  provider               = aws.development
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.route_table.id
  gateway_id             = aws_internet_gateway.igw.id
}


#AWS Security Group - Private
# resource "aws_security_group" "sg_private" {
#   provider = aws.development
#   name = "private_subnet_sg"
#   description = "private security group"
#   vpc_id = aws_vpc.vpc.id  


#   tags = {
#     "Name" = "private_security_group"
#   }
# }

#AWS Security Group - Public
resource "aws_security_group" "sg_public" {
  provider    = aws.development
  name        = "public_subnet_sg"
  description = "public security group"

  ingress {
    description = "from my ip range"
    from_port   = "3389"
    to_port     = "3389"
    protocol    = "tcp"
    cidr_blocks = ["147.219.191.9/24"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }

  tags = {
    "Name" = "public_security_group"
  }
}

#AWS Network Interface ENI - Private
# resource "aws_network_interface" "eni_private" {
#   provider = aws.development
#   subnet_id = aws_subnet.subnet_private.id
#   private_ips = [var.private_ip_address]
#   security_groups = [aws_security_group.sg_private.id]

#   attachment {

#   }
# }

#AWS Network Interface ENI - Public
resource "aws_network_interface" "eni_public" {
  provider        = aws.development
  subnet_id       = aws_subnet.subnet_public.id
  private_ips     = [var.private_ip_address]
  security_groups = [aws_security_group.sg_public.id]

}