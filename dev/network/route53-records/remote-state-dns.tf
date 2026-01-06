data "terraform_remote_state" "dns" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dns/terraform.tfstate"
    region = "us-east-1"
  }
}
