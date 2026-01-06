data "terraform_remote_state" "lt" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/frontend/launch-template/terraform.tfstate"
    region = var.region
  }
}
