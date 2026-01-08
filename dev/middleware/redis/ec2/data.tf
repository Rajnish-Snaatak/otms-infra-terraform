# VPC
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

# Subnets
data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/subnets/terraform.tfstate"
    region = "us-east-1"
  }
}

# IAM
data "terraform_remote_state" "iam_global" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/iam-global/ec2-base-role/terraform.tfstate"
    region = "us-east-1"
  }
}

# Redis SG
data "terraform_remote_state" "redis_sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/middleware/redis/sg/terraform.tfstate"
    region = "us-east-1"
  }
}

# Latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
