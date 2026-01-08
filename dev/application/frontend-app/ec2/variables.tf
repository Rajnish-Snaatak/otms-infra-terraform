variable "app_name" {
  description = "The name of the frontend application"
  type        = string
  default     = "frontend-app"
}

variable "ami_id" {
  description = "AMI ID for the frontend EC2 instance"
  type        = string
  default     = "ami-03cc4e5014964f57f"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
