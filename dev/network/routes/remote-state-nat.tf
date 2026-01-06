data "terraform_remote_state" "nat" {
  backend = "s3"

  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/nat/terraform.tfstate"
    region = "us-east-1"
  }
}
