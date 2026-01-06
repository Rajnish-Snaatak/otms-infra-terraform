variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "path_pattern" {
  type        = string
  description = "Path pattern for Salary API routing"
}

variable "priority" {
  type        = number
  description = "Listener rule priority (must be unique)"
}
