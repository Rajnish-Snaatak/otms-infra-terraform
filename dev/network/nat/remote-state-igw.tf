data "terraform_remote_state" "igw" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/igw/terraform.tfstate"
    region = "us-east-1"
  }
}
