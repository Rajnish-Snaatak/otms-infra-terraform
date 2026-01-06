variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "app_name" {
  type = string
}

variable "app_port" {
  type        = number
  description = "attendance API application port"
}
