data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/db/postgre/sg/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "redis_sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/middleware/redis/sg/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/subnets/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "salary_sg" {
  backend = "s3"

  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/salary-api/security-groups/terraform.tfstate"
    region = "us-east-1"
  }
}
data "terraform_remote_state" "scylla_sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/db/scylla/sg/terraform.tfstate"
    region = "us-east-1"
  }
}
