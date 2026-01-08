variable "aws_region" {
  type    = string
}

variable "path_pattern" {
  type        = string
  description = "Path pattern for Attendance API routing"
}

variable "priority" {
  type        = number
  description = "Listener rule priority (must be unique)"
}

