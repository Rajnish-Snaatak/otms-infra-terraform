terraform {
  backend "s3" {
    bucket         = "dev-otms-terraform-state"
    key            = "dev/db/postgre/ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-otms-terraform-locks"
    encrypt        = true
  }
}
