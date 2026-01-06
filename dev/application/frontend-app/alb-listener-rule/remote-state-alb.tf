data "terraform_remote_state" "alb" {
  backend = "s3"

  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/alb/terraform.tfstate"
    region = "us-east-1"
  }
}
