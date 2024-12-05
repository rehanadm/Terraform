terraform {
  required_providers {
    aws = {
     ## source  = "hashicorp/aws"
      version = "5.79.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "XXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

resource "aws_instance" "terraform" {
  ami           = "ami-0b0af3577fe5e3532"
  instance_type = "t2.micro"
  key_name = "terraformkey1"
  security_groups = ["default"]
  tags = {
    Name = "terraform-testserver"
  }
}
