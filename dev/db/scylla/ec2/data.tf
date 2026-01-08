# VPC remote state
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

# Subnets remote state
data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/subnets/terraform.tfstate"
    region = "us-east-1"
  }
}


data "terraform_remote_state" "iam_global" {
   backend = "s3"
   config = {
	 bucket = "dev-otms-terraform-state"
	 key = "dev/iam-global/ec2-base-role/terraform.tfstate"
	 region = "us-east-1"
   }
 }


# scylla SG remote state
data "terraform_remote_state" "scylla_sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/db/scylla/sg/terraform.tfstate"
    region = "us-east-1"
  }
}

# Subnets
data "aws_subnet" "database" {
  id = data.terraform_remote_state.subnets.outputs.database_subnet
}

data "aws_subnet" "public_1" {
  id = data.terraform_remote_state.subnets.outputs.public_subnets[0]
}

data "aws_subnet" "public_2" {
  id = data.terraform_remote_state.subnets.outputs.public_subnets[1]
}

# Latest Ubuntu 22.04 LTS AMI
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
