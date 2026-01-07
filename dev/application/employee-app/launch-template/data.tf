data "terraform_remote_state" "employee_sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/employee-api/security-group/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "iam_global" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/iam-global/ec2-base-role/terraform.tfstate"
    region = "us-east-1"
  }
}
