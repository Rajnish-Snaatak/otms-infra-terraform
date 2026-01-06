variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "application" {
  description = "Application name"
  type        = string
}

variable "owner" {
  description = "Owner of the resource"
  type        = string
}

variable "cost_center" {
  description = "Cost center for billing"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
}

variable "min_size" {
  description = "Minimum ASG size"
  type        = number
}

variable "max_size" {
  description = "Maximum ASG size"
  type        = number
}
