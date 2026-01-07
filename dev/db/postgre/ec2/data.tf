############################################################
# Fetch network outputs dynamically
############################################################
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

############################################################
# Fetch Postgres Security Group from remote state
############################################################
data "terraform_remote_state" "postgres_sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/db/postgre/sg/terraformstatefile"
    region = "us-east-1"
  }
}

############################################################
# Fetch ALB remote state
############################################################
data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/alb/terraform.tfstate"
    region = "us-east-1"
  }
}

############################################################
# Fetch Frontend Security Group remote state
############################################################
data "terraform_remote_state" "frontend" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/frontend/security-group/terraform.tfstate"
    region = "us-east-1"
  }
}

############################################################
# Subnets from network remote state
############################################################
data "aws_subnet" "database" {
  id = data.terraform_remote_state.network.outputs.database_subnet
}

data "aws_subnet" "public_1" {
  id = data.terraform_remote_state.network.outputs.public_subnets[0]
}

data "aws_subnet" "public_2" {
  id = data.terraform_remote_state.network.outputs.public_subnets[1]
}

############################################################
# Latest Ubuntu 22.04 LTS AMI
############################################################
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical account

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
