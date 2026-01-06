data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/network/vpc/terraform.tfstate"
    region = var.region
  }
}

data "terraform_remote_state" "bastion" {
  backend = "s3"
  config = {
    bucket = "dev-otms-terraform-state"
    key    = "dev/application/bastion/security-group/terraform.tfstate"
    region = var.region
  }
}

resource "aws_security_group" "frontend_sg" {
  name        = "${var.environment}-${var.application}-sg"
  description = "Security group for frontend application"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  # HTTP from ALB
  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [
      data.terraform_remote_state.alb.outputs.alb_sg_id
    ]
  }

  # SSH from Bastion
  ingress {
    description     = "SSH from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [
      data.terraform_remote_state.bastion.outputs.bastion_sg_id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-${var.application}-sg"
    }
  )
}
