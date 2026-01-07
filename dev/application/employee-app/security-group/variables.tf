variable "app_name" {
  type        = string
  description = "Name of the Employee application"
}

variable "app_port" {
  type        = number
  description = "Port on which the Employee application listens"
}

variable "vpc_state_bucket" {
  type    = string
}
variable "vpc_state_key" {
  type    = string
}

variable "alb_state_bucket" {
  type    = string
}
variable "alb_state_key" {
  type    = string
}

variable "frontend_state_bucket" {
  type    = string
}
variable "frontend_state_key" {
  type    = string
}
variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources in"
  default     = "us-east-1"  # optional, you can set your desired default
}
