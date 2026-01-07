data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/notification-worker/security-group/terraform.tfstate"
    region = var.aws_region
  }
}
