provider "aws" {
  access_key = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  region     = "us-east-1"
}

terraform {
  required_version = ">= 1.10.0"
}

resource "aws_instance" "terraform-server" {
  ami             = "ami-0453ec754f44f9a4a"
  instance_type   = "t2.micro"
  key_name        = "terraformkey1"
  subnet_id       = "subnet-0fa6b4c5b23395281"
  tags = {
    Name = "Terraform-instance"
  }
}

resource "aws_eip" "terraform-instance-eip" {
  instance = aws_instance.terraform-server.id
  vpc      = true
}

