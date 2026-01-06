data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/alb/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "frontend" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/frontend/security-group/terraform.tfstate"
    region = "us-east-1"
  }
}
