variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for Notification Worker EC2"
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "app_name" {
  type = string
}
