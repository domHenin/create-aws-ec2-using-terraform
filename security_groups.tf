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
    cidr_blocks = ["147.219.191.0/24"]
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