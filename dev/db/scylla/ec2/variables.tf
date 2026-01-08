variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.xlarge"
}

variable "ami_id" {
  description = "Golden AMI ID for EC2 / Launch Template"
  type        = string
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

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "Dev"
}

