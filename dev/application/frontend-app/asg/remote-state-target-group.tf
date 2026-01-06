data "terraform_remote_state" "tg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/frontend/target-group/terraform.tfstate"
    region = var.region
  }
}

