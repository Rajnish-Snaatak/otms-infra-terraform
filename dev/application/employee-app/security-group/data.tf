data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.vpc_state_bucket
    key    = var.vpc_state_key
    region = "us-east-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = var.alb_state_bucket
    key    = var.alb_state_key
    region = "us-east-1"
  }
}

data "terraform_remote_state" "frontend" {
  backend = "s3"
  config = {
    bucket = var.frontend_state_bucket
    key    = var.frontend_state_key
    region = "us-east-1"
  }
}
