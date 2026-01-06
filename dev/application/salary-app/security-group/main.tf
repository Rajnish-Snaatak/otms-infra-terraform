resource "aws_security_group" "this" {
  name        = "${var.app_name}-sg"
  description = "Security group for ${var.app_name}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  
  ingress {
    description     = "Allow traffic from ALB"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [
      data.terraform_remote_state.alb.outputs.alb_sg_id
    ]
  }

  
  ingress {
    description     = "Allow traffic from Frontend application"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [
      data.terraform_remote_state.frontend.outputs.frontend_sg_id
    ]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.app_name}-sg"
    Application = var.app_name
    Environment = "dev"
  }
}
