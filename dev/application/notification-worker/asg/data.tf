data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/subnets/terraform.tfstate"
    region = var.aws_region
  }
}

data "terraform_remote_state" "lt" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/notification-worker/launch-template/terraform.tfstate"
    region = var.aws_region
  }
}
