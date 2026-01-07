data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/alb/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "target_group" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/employee-api/target-group/terraform.tfstate"
    region = "us-east-1"
  }
}
