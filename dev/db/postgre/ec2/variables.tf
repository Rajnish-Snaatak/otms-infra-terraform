variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "app_name" {
  description = "The name of the application / instance tag"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "Dev"
}

variable "postgres_key_name" {
  type = string
}

variable "ami_id" {
  description = "Golden AMI ID for EC2 instances"
  type        = string
}
