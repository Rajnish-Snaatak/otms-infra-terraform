data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/alb/terraform.tfstate"
    region = var.aws_region
  }
}

data "terraform_remote_state" "tg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/notification-worker/target-group/terraform.tfstate"
    region = var.aws_region
  }
}
