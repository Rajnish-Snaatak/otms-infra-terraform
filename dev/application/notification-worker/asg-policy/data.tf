data "terraform_remote_state" "asg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/notification-worker/asg/terraform.tfstate"
    region = var.aws_region
  }
}
