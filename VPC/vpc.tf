
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# AWS Provider Configuration
provider "aws" {
  region = "us-west-2"

  # Common tags for all supported resources
  default_tags {
    tags = {
      Environment = "Dev"
      Project     = "Terraform-VPC-Lab"
      ManagedBy   = "Terraform"
    }
  }
}

# 1. Create VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Demo-VPC"
  }
}

# 2. Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet"
    Type = "Public"
  }
}

# 3. Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Private-Subnet"
    Type = "Private"
  }
}

# 4. Create Internet Gateway
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "Demo-Internet-Gateway"
  }
}

# 5. Create Public Route Table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}

# 6. Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rtb.id
}
