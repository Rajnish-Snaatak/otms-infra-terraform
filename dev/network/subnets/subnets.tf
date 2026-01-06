# Public Subnet 1
resource "aws_subnet" "public_1" {
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Dev-Public-Subnet-01"
  }
}

# Public Subnet 2
resource "aws_subnet" "public_2" {
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Dev-Public-Subnet-02"
  }
}

# Frontend Subnet
resource "aws_subnet" "frontend" {
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = "10.0.14.0/23"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Dev-Frontend-Subnet"
  }
}

# Backend Subnet
resource "aws_subnet" "backend" {
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = "10.0.8.0/22"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Dev-Backend-Subnet"
  }
}

# Database Subnet
resource "aws_subnet" "database" {
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = "10.0.16.0/25"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Dev-Database-Subnet"
  }
}

# Middleware Subnet
resource "aws_subnet" "middleware" {
  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block        = "10.0.12.0/23"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Dev-Middleware-Subnet"
  }
}

