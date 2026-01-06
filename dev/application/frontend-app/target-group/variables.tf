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

variable "tg_port" {
  description = "Target group port"
  type        = number
  default     = 80
}

variable "tg_protocol" {
  description = "Target group protocol"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}
