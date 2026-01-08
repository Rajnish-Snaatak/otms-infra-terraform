data "terraform_remote_state" "lt" {
backend = "s3"
config = {
bucket = "dev-otms-terraform-state"
key = "dev/application/attendance-api/launch-template/terraform.tfstate"
region = "us-east-1"
}
}


data "terraform_remote_state" "tg" {
backend = "s3"
config = {
bucket = "dev-otms-terraform-state"
key = "dev/application/attendance-api/target-group/terraform.tfstate"
region = "us-east-1"
}
}


data "terraform_remote_state" "subnets" {
backend = "s3"
config = {
bucket = "dev-otms-terraform-state"
key = "dev/network/subnets/terraform.tfstate"
region = "us-east-1"
}
}
