variable "listener_priority" {
  description = "Priority of the ALB listener rule"
  type        = number
}

variable "path_patterns" {
  description = "Path patterns for ALB listener rule"
  type        = list(string)
}
