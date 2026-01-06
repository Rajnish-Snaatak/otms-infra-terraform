data "terraform_remote_state" "asg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/salary-api/asg/terraform.tfstate"
    region = "us-east-1"
  }
}
