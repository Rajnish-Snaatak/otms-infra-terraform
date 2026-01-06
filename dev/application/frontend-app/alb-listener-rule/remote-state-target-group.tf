data "terraform_remote_state" "target_group" {
  backend = "s3"

  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/frontend/target-group/terraform.tfstate"
    region = "us-east-1"
  }
}
