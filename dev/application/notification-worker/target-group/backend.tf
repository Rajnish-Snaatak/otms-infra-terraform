terraform {
  backend "s3" {
    bucket         = "dev-otms-terraform-state"
    key            = "dev/application/notification-worker/target-group/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-otms-terraform-locks"
    encrypt        = true
  }
}
