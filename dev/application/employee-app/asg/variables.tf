variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "app_name" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}
