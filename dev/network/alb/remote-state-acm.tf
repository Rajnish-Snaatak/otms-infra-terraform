data "terraform_remote_state" "acm" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/acm/terraform.tfstate"
    region = "us-east-1"
  }
}
