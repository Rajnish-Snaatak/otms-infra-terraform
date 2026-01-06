data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/subnets/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "launch_template" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/salary-api/launch-template/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "target_group" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/salary-api/target-group/terraform.tfstate"
    region = "us-east-1"
  }
}
