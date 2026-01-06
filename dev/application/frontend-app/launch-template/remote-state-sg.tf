data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/frontend/security-group/terraform.tfstate"
    region = "us-east-1"
  }
}
