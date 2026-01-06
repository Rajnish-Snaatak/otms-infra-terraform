variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "target_cpu_utilization" {
  type        = number
  description = "Target average CPU utilization percentage"
}
