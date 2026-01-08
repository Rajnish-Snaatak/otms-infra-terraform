# Remote state for the Attendance ALB
data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/alb/terraform.tfstate"   # Correct path to the applied ALB module
    region = "us-east-1"
  }
}

# Remote state for the Attendance API Target Group
data "terraform_remote_state" "target_group" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/attendance-api/target-group/terraform.tfstate"
    region = "us-east-1"
  }
}

