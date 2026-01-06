variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  type = string
}
