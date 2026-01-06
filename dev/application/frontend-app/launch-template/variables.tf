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

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "ami_name_pattern" {
  description = "AMI name pattern"
  type        = string
}
