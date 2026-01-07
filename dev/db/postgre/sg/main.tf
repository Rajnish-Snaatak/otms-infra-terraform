resource "aws_security_group" "postgres" {
  name        = "${var.app_name}-sg"
  description = "Postgres security group"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.app_name
    Application = var.app_name
    Environment = "dev"
    CostCenter  = "OTMS-Platform"
    Owner       = "DevOps-Team"
  }
}
