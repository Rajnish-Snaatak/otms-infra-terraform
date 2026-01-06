variable "vpc_cidr" {
  default = "10.0.0.0/18"
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to SSH into bastion"
  default     = "0.0.0.0/0" # ⚠️ replace with YOUR_IP/32
}

variable "domain_name" {
  description = "Root domain name"
  default     = "thakurd.space"
}
