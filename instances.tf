#AWS SSM Parameter 
data "aws_ssm_parameter" "application_ami" {
  provider = aws.development
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


#AWS Instance - App Server 1
resource "aws_instance" "app_server" {
  provider                    = aws.development
  ami                         = data.aws_ssm_parameter.application_ami.value
  instance_type               = var.instance_type
  associate_public_ip_address = true
  # vpc_security_group_ids = [aws_security_group.sg_public.id]
  # subnet_id = aws_subnet.subnet_public.id

  network_interface {
    network_interface_id  = aws_network_interface.eni_public.id
    device_index          = 0
    delete_on_termination = false
  }

  key_name = "migenjutsu_sandbox"

  tags = {
    Name = "app_server_1"
  }
}


resource "aws_instance" "app_server2" {

}