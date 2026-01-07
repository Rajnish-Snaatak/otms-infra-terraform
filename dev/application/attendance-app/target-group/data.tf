data "terraform_remote_state" "vpc" {
backend = "s3"
config = {
bucket = "dev-otms-terraform-state"
key = "dev/network/vpc/terraform.tfstate"
region = "us-east-1"
}
}
