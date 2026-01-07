data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/db/postgre/sg/terraform.tfstate"
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
