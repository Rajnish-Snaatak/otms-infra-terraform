terraform {
  backend "s3" {
    bucket         = "dev-otms-terraform-state"
    key            = "dev/iam-global/ec2-base-role/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-otms-terraform-locks"
    encrypt        = true
  }
}
