variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "role_name" {
  type        = string
  description = "Global EC2 IAM role name"
}
