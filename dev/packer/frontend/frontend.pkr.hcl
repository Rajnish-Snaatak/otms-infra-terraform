packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1.8"
    }
  }
}

variable "region" {
  default = "us-east-1"
}

variable "subnet_id" {
  description = "Subnet where Packer will launch the temporary instance"
  default     = "subnet-00ffd190810b5c2a8"
}

source "amazon-ebs" "frontend" {
  region        = var.region
  ami_name      = "frontend-ami-{{timestamp}}"
  instance_type = "t3.medium"

  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"] # Canonical
  }

  ssh_username = "ubuntu"

  tags = {
    Name = "packer-frontend"
    Env  = "dev"
  }
}

build {
  name    = "frontend-ami"
  sources = ["source.amazon-ebs.frontend"]

  provisioner "shell" {
    script = "install_frontend.sh"
  }
}
