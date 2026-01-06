data "terraform_remote_state" "asg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/frontend/asg/terraform.tfstate"
    region = var.region
  }
}
