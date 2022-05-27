variable "profile" {
  type    = string
  default = "cloud_user"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "private_ip_address" {
  type    = string
  default = "10.20.20.120"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}