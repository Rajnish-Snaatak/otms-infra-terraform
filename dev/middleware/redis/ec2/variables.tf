variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "ami_id" {
 type    = string
 description = "Golden AMI ID"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "app_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "Dev"
}

variable "redis_key_name" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

