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


# Postgres SG remote state
data "terraform_remote_state" "postgres_sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/db/postgre/sg/terraform.tfstate"
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

# Fixed Ubuntu Golden AMI
data "aws_ami" "ubuntu" {
  most_recent = false

  filter {
    name   = "image-id"
    values = ["ami-082f5336188705f7c"]
  }
}
