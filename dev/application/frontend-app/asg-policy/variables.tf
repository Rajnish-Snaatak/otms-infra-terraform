variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "application" {
  type        = string
  description = "Application name"
}

variable "owner" {
  type        = string
}

variable "cost_center" {
  type        = string
}

variable "region" {
  type        = string
}

variable "cpu_target_value" {
  type        = number
  description = "Target CPU utilization for ASG scaling"
}

